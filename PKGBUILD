# Maintainer: Tim Yang <protonmail = timdyang>

pkgname=gnome-shell-extension-control-blur-effect-on-lock-screen-git
pkgver=r3.748b95e
pkgrel=1
pkgdesc="Control the GNOME lock screen's blur sigma and brightness"
arch=(any)
url="https://github.com/PRATAP-KUMAR/Control_Blur_Effect_On_Lock_Screen"
license=(GPL3)
depends=('gnome-shell>=3.36.0' 'gnome-tweaks')
makedepends=(git)
provides=(${pkgname/-git})
source=($pkgname::git+$url)
md5sums=(SKIP)

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $pkgname
    _uuid="$(grep -oP '(?<="uuid": ")[^"]*' metadata.json)"
    install -dm755 "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"
    cp -a * "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

    # sanitize
    rm -f "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"{LICENSE,README.md}
    find "$pkgdir" -type f -exec chmod 644 '{}' \;
    find "$pkgdir" -type d -exec chmod 755 '{}' \;
    chown -R root:root "$pkgdir"
}

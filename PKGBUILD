# Maintainer: Marcel B <mr.arsikoff@gmail.com>
pkgname="sddm-silent-theme-git"
_upstream_name="SilentSDDM"
pkgdesc="Highly customizable SDDM theme (git version)"
pkgver=r20250626.gbbe3505
pkgrel=2
arch=('any')
depends=('sddm' 'qt6-svg' 'qt6-virtualkeyboard' 'qt6-multimedia-ffmpeg' 'redhat-fonts')
makedepends=('git')
provides=('sddm-silent-theme')
conflicts=('sddm-silent-theme')
url='https://github.com/uiriansan/SilentSDDM'
license=('GPL-2.0-only')
source=("git+$url.git")
sha256sums=('SKIP')
backup=('usr/share/sddm/themes/silent/metadata.desktop')

pkgver() {
    cd "$_upstream_name"
    printf 'r%s.g%s\n' "$(git log -1 --date=format:%Y%m%d --pretty=format:%cd)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_upstream_name"
    rm install.sh
    # rm -r docs
    rm -rf .github
    rm -r fonts # not used by the theme from that directory. satisfied by redhat-fonts
    rm -f ./*.nix
    mkdir -p "$pkgdir/usr/share/sddm/themes/silent"
    cp -r ./* "$pkgdir/usr/share/sddm/themes/silent"
    find "$pkgdir/usr/share/sddm/themes/silent" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share/sddm/themes/silent" -type f -exec chmod 644 {} +
    chmod +x "$pkgdir/usr/share/sddm/themes/silent"*.sh
}

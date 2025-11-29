# Maintainer: Marcel B <mr.arsikoff@gmail.com>
pkgname="sddm-silent-theme-git"
upstreamname="SilentSDDM"
pkgdesc="Highly customizable SDDM theme (git version)"
pkgver=r20251023.ge334d92
pkgrel=1
arch=('any')
depends=('sddm' 'qt6-svg' 'qt6-virtualkeyboard' 'qt6-multimedia-ffmpeg' 'redhat-fonts')
makedepends=('git')
provides=('sddm-silent-theme')
conflicts=('sddm-silent-theme')
url="https://github.com/uiriansan/$upstreamname"
license=('GPL-2.0-only')
source=("git+$url.git")
sha256sums=('SKIP')
installdir="usr/share/sddm/themes/silent"
backup=("$installdir/metadata.desktop")

pkgver() {
    cd "$upstreamname"
    printf 'r%s.g%s\n' "$(git log -1 --date=format:%Y%m%d --pretty=format:%cd)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$upstreamname"
    rm install.sh
    # rm -r docs
    rm -rf .github
    rm -r fonts # not used by the theme from that directory. satisfied by redhat-fonts
    rm -f ./*.nix
    rm -f ./flake.lock
    mkdir -p "$pkgdir/$installdir"
    cp -r ./* "$pkgdir/$installdir"
    find "$pkgdir/$installdir" -type d -exec chmod 755 {} +
    find "$pkgdir/$installdir" -type f -exec chmod 644 {} +
    chmod +x "$pkgdir/$installdir/"*.sh
}

# Maintainer: Marcel B <mr.arsikoff@gmail.com>
pkgname="sddm-silent-theme"
upstreamname="SilentSDDM"
pkgdesc="Highly customizable SDDM theme"
pkgver=1.3.7
pkgrel=1
arch=('any')
depends=('sddm' 'qt6-svg' 'qt6-virtualkeyboard' 'qt6-multimedia-ffmpeg' 'redhat-fonts')
url="https://github.com/uiriansan/$upstreamname"
license=('GPL-2.0-only')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a003fffd78ea6e2ee45806c849a2d35519f75aa236f6a1af79f438184c46008f')
installdir="usr/share/sddm/themes/silent"
backup=("$installdir/metadata.desktop")

package() {
    cd "$upstreamname-$pkgver"
    rm install.sh
    # docs/ contains the screenshot for the theme
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

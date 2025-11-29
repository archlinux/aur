# Maintainer: Marcel B <mr.arsikoff@gmail.com>
pkgname="sddm-silent-theme"
upstreamname="SilentSDDM"
pkgdesc="Highly customizable SDDM theme"
pkgver=1.3.6
pkgrel=1
arch=('any')
depends=('sddm' 'qt6-svg' 'qt6-virtualkeyboard' 'qt6-multimedia-ffmpeg' 'redhat-fonts')
url="https://github.com/uiriansan/$upstreamname"
license=('GPL-2.0-only')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9f475e113b8ff9349b17befabcd5ae66de49c8eb4fd8ad7e1981efc594fa8a53')
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

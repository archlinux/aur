# Maintainer: Tharre <tharre3@gmail.com>
# Contributor: Alex Szczuczko <alex at szc dot ca>

pkgname=papersplease
pkgver=1.1.65
pkgrel=6
pkgdesc="Assume the role of an immigration inspector for the communist state of Arstotzka"
arch=('i686' 'x86_64')
url="http://papersplea.se"
license=('custom:commercial')
depends=('hicolor-icon-theme')
depends_x86_64=('lib32-libgl')
depends_i686=('libgl')
options=(!strip)
source=("$pkgname.desktop"
        "launch-$pkgname.sh"
        "$pkgname.png"
        "papers-please_${pkgver}_i386.tar.gz::hib://papers-please_${pkgver}_i386.tar.gz")
sha256sums=('478b736281d4d397bcff3972a548dc85bddae49342d561adefa25186310cd5ec'
            'e199745f2158fd04fd70ce463aa57452be3a5d8c9c390970e2cadbe7d2122dd4'
            'e8aaf890dbfa6363f0197892ca2abd5ac4a45918787a8524cf8c99d785000823'
            '50562ad2b01cb7558147cd05de4dc37c02deb2e66fc5d3bff77994785f9551d7')

# Disable compression of the package
PKGEXT='.pkg.tar'

# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

package() {
    cd "$srcdir"

    # bin
    install -Dm755 launch-papersplease.sh "$pkgdir/usr/bin/$pkgname"

    # license
    install -Dm644 papers-please/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm papers-please/LICENSE

    # icon
    install -Dm644 "$pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/128x128/apps"

    # .desktop
    install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"

    # rest
    install -dm755 "${pkgdir}/opt/"
    cp -r papers-please "${pkgdir}/opt/${pkgname}/"
}

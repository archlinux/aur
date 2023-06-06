# Maintainer: wirano

pkgname=kicad-library-espressif-git
_repo=kicad-libraries
pkgver=2.0.0.r1.g1d73b2e
pkgrel=1
pkgdesc="KiCad libraries for Espressif chips and modules"
arch=('any')
url="https://github.com/espressif/$_repo"
license=('CC-BY-SA 4.0')
makedepends=('git')
depends=('kicad')
provides=('kicad-library-espressif')
conflicts=('kicad-library-espressif')
source=("git+https://github.com/espressif/$_repo.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_repo"

    # increasing pkg version:
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${_repo}"

    install -d "$pkgdir/usr/share/kicad/symbols"
    cp -r symbols "$pkgdir/usr/share/kicad"

    install -d "$pkgdir/usr/share/kicad/footprints"
    cp -r footprints "$pkgdir/usr/share/kicad"

    install -d "$pkgdir/usr/share/kicad/3dmodels"
    cp -r 3dmodels "$pkgdir/usr/share/kicad"

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

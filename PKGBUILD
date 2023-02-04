# Maintainer: wirano

pkgname=kicad-library-espressif-git
_repo=kicad-libraries
pkgver=r68.a8a536c
pkgrel=1
pkgdesc="KiCad libraries for Espressif chips and modules"
arch=('any')
url="https://github.com/espressif/$_repo"
license=('CC-BY-SA 4.0')
makedepends=('git')
depends=('kicad')
# conflicts=('kicad-library-bzr')
source=("git+https://github.com/espressif/$_repo.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_repo"

    # increasing pkg version:
    cnt=$(git rev-list HEAD --count)
    hash=$(git rev-parse --short HEAD)
    echo "r$cnt.$hash"
}

package() {
    cd "$srcdir/${_repo}"

    install -d "$pkgdir/usr/share/kicad/symbols"
    cp -r libraries/* "$pkgdir/usr/share/kicad/symbols/"

    install -d "$pkgdir/usr/share/kicad/footprints"
    cp -r footprints "$pkgdir/usr/share/kicad"

    install -d "$pkgdir/usr/share/kicad/3dmodules/Espressif.pretty"
    cp -r 3d/* "$pkgdir/usr/share/kicad/3dmodules/Espressif.pretty"

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

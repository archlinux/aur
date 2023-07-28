# Maintainer: x70b1

pkgname=kicad-kibuzzard-git
pkgver=r177.da33521
pkgrel=1
pkgdesc="This kicad plugin lets you easily create labels in various fonts."
arch=("any")
url="https://github.com/gregdavill/KiBuzzard"
license=("MIT")
makedepends=("git")
depends=("kicad>=5.1.0")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    set -o pipefail
    git describe --long 2> /dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${pkgname}
    mkdir -p "$pkgdir/usr/share/kicad/scripting/plugins/KiBuzzard"
    cp -r KiBuzzard "$pkgdir"/usr/share/kicad/scripting/plugins/
}

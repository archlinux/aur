# Contributor: taotieren <admin@taotieren.com>

pkgname=simple-image-filter-git
proname=simple-image-filter-process
pkgver=1.1.0
pkgrel=1
pkgdesc="Deepin DDe simple image filter qt"
arch=('any')
url="https://github.com/dependon/simple-image-filter"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
#replaces=(${pkgname})
depends=(qt5-tools)
makedepends=(git
             qconf
             pkgconfig
             make)
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    qmake ./${proname}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make INSTALL_ROOT="${pkgdir}" -C ./build install
}

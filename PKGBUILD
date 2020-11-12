# Maintainer: Louis Cornell <lpcornel@gmail.com>
pkgname=archsimian-git
pkgver=r506.43a9949
pkgrel=1
pkgdesc="Advanced playlist creator that uses your MediaMonkey library data"
arch=('x86_64')
url="https://github.com/Harpo3/archsimian"
license=('GPL3')
depends=('qt5-base' 'sqlite3' 'taglib' 'id3v2')
optdepends=('kdeconnect: sync support'
                    'dolphin: sync support'
                    'syncthing: sync support'
                    'audacious: sync support')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Harpo3/archsimian')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-git}"
	qmake -o Makefile ArchSimian.pro
    make
}

package() {
    cd "${pkgname%-git}"
    make INSTALL_ROOT="$pkgdir" install
}

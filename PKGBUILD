# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=thor-git
pkgver=v2.0.r14.g3aee360
pkgrel=1
pkgdesc="Thor, SFML based library"
arch=('i686' 'x86_64')
url="http://www.bromeon.ch/libraries/thor/index.html"
license=('zlib')
depends=('sfml-git')
makedepends=('cmake' 'git')
provides=('thor-sfml')
options=('debug')

source=("git+https://github.com/Bromeon/Thor.git"
"0001-cmake_install_module.patch")

sha256sums=('SKIP'
'ef23db1723fbcf1cc9eb5e0180e86826a79cc1fbac93a5790149de1aab27fbba')

pkgver() {
    cd "${srcdir}/Thor"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/Thor"
    patch -p0 -i "${srcdir}/0001-cmake_install_module.patch"
}

build() {
    cd "$srcdir/Thor"

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebugInfo .
    make
}

package() {
    cd "$srcdir/Thor"

    make DESTDIR="$pkgdir/" install

    install -Dm644 ./License.txt ${pkgdir}/usr/share/licenses/${pkgname}/License.txt

}

# vim:set ts=2 sw=2 et:

# Maintainer: Wesley Chan https://aur.archlinux.org/account/Wesley_Chan
# Original authors: Sven-Hendrik Haase <sh@lutzhaase.com>, Markus Martin <markus@archwyrm.net>

pkgname=yaml-cpp-git
pkgver=r684.e92321a
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec"
url="https://github.com/jbeder/yaml-cpp"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gcc-libs')
conflicts=('yaml-cpp')
provides=('yaml-cpp')
makedepends=('boost' 'cmake')
source=(${pkgname}::git+https://github.com/jbeder/yaml-cpp.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$pkgname

    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON
    make
}

package() {
    cd $srcdir/$pkgname

    make DESTDIR=$pkgdir install

    install -Dm644 yaml-cpp-config.cmake $pkgdir/usr/lib/cmake/${pkgname}/yaml-cpp-config.cmake
    install -Dm644 yaml-cpp-config-version.cmake $pkgdir/usr/lib/cmake/${pkgname}/yaml-cpp-config-version.cmake
    install -Dm644 yaml-cpp-targets.cmake $pkgdir/usr/lib/cmake/${pkgname}/yaml-cpp-targets.cmake

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

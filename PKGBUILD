# Contributor: Sven Brauch <svenbrauch@gmail.com>

pkgname=kdevelop-python3-git
pkgver=2.0
pkgrel=1
pkgdesc="Python language plugin for KDevelop - Git build, Python 3 version"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
groups=('kde' 'kdevelop-plugins')
depends=('kdevplatform-git' 'kdevelop-git' 'python=3.5.0')
makedepends=('cmake' 'automoc4' 'git' 'python=3.5.0')
source=('git+git://anongit.kde.org/kdev-python')
provides=('kdevelop-python')
conflicts=('kdevelop-python')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/kdev-python"
    git describe --long | sed -r 's/^foo-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/kdev-python"

    mkdir -p "$srcdir/kdev-python/build"
    cd "$srcdir/kdev-python/build"

    cmake .. \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
    cd "$srcdir/kdev-python/build"

    make DESTDIR="$pkgdir/" install
}

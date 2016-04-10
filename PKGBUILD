# Contributor: Felix Mauch <felix_mauch@web.de>

pkgname=kdevelop-php-git
pkgver=v4.90.91.r33.gd3b3852
pkgrel=1
pkgdesc="PHP language plugin for KDevelop - Git build"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
groups=('kde' 'kdevelop-plugins')
depends=('kdevplatform-git' 'kdevelop-git' 'php')
makedepends=('cmake' 'automoc4' 'git' 'php')
source=('git+git://anongit.kde.org/kdev-php.git')
provides=('kdevelop-php')
conflicts=('kdevelop-php')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/kdev-php"
    git describe --long | sed -r 's/^foo-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/kdev-php"

    mkdir -p "$srcdir/kdev-php/build"
    cd "$srcdir/kdev-php/build"

    cmake ../ \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

    make
}

package() {
    cd "$srcdir/kdev-php/build"

    make DESTDIR="$pkgdir/" install
}

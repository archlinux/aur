# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=phpspy
pkgver=r142.git
pkgrel=1
pkgdesc="Low-overhead sampling profiler for PHP 7"
arch=('i686' 'x86_64')
url="https://github.com/adsr/phpspy"
makedepends=('git')
license=('unknown')
source=('git://github.com/adsr/phpspy.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo "r$(git rev-list --count HEAD).git"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  sed -i "s|\$(or \$(has_pthread), \$(error Need libpthread))| |g" Makefile
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -m 755 -D phpspy "${pkgdir}/usr/bin/phpspy"
}

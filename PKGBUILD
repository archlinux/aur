# Maintainer: Lukas Böger <dev  AT  lboeger  DOT  de>

pkgname=tsym-git
pkgver=g2374745
pkgrel=1

pkgdesc='A tiny C++ computer algebra library'
arch=('i686' 'x86_64')
url="https://github.com/lubgr/${pkgname%-git}"
license=('GPL3')

source=("git+${url}.git#branch=develop")
md5sums=('SKIP')

makedepends=('git' 'scons')
conflicts=(${pkgname%-git})

pkgver() {
    cd "${srcdir}/${pkgname%-git}"

    echo -n 'g'

    git log -1 --pretty=format:'%h'
}

build() {
    cd "${srcdir}/${pkgname%-git}"

    scons lib
}

check() {
  cd "${srcdir}/${pkgname%-git}"

  scons test

  ./build/runtests
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    scons PREFIX="${pkgdir}/usr" install
}


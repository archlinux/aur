# Maintainer: BrLi <brli at chakralinux dot org>

pkgname=kasumi-git
_pkgname=kasumi
pkgver=2.5.r13.83b6025
pkgrel=2
pkgdesc="A personal dictionary manager for Anthy"
url="https://en.osdn.jp/projects/kasumi/"
arch=(any)
licence=('GPL2')
depends=('anthy' 'gtk3')
makedepends=('git' 'intltool')
provides=(${_pkgname})
conflicts=(${_pkgname})
_commit=83b60259ea1b9b4e94d97397c8e2ea1ee6a35fc4
source=(git+https://github.com/Keruspe/kasumi.git)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "2.5.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    autoreconf -i -Wall
    intltoolize --force --automake
}

build() {
    export CXXFLAGS='-std=c++14'
    cd ${srcdir}/${_pkgname}
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd ${srcdir}/${_pkgname}
    make DESTDIR="${pkgdir}" install
}

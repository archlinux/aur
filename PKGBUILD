# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=libfyaml
pkgver=0.9
pkgrel=1
pkgdesc='Fully feature complete YAML parser and emitter'
arch=('x86_64')
url='https://pantoniou.github.io/libfyaml'
optdepends=('jq')
license=('MIT')
source=(https://github.com/pantoniou/libfyaml/releases/download/v${pkgver}/libfyaml-${pkgver}.tar.gz)

sha512sums=('95979361ed50a46acc6da698e4750562f6e3e46aa5d050180225d93afb74929981d9c1d1ca3b6a77fe21a1546a68a9e3df17cdfef5f93257ad5d0c7ad03ae2eb')

prepare() {
    sed -i '416s/1/0/g' ${pkgname}-${pkgver}/configure.ac # https://github.com/pantoniou/libfyaml/issues/99
}

build() {
    cd "$srcdir"/libfyaml-${pkgver}
    ./bootstrap.sh
    ./configure --prefix=/usr
    make
}


check() {
    cd "$srcdir"/libfyaml-${pkgver}
    make check
}


package() {
  cd "$srcdir"/libfyaml-${pkgver}
  make DESTDIR="$pkgdir/" install || return 1
}

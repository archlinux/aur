# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=libfyaml
pkgver=0.9
pkgrel=4
pkgdesc='Fully feature complete YAML parser and emitter'
arch=(x86_64)
url=https://pantoniou.github.io/libfyaml
license=(MIT)
optdepends=(jq)
source=(https://github.com/pantoniou/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        UGM3.patch)
sha512sums=('95979361ed50a46acc6da698e4750562f6e3e46aa5d050180225d93afb74929981d9c1d1ca3b6a77fe21a1546a68a9e3df17cdfef5f93257ad5d0c7ad03ae2eb'
            '8684156f1800de6f99b296f6e8ab4868633636be61c68958b22552c142932475cf0b9d495dc03f317aff3c2ec80ca9c934b803840e6194ae43fb10f042f99223')

prepare() {
    patch -d ${pkgname}-${pkgver} -Np1 -i ../UGM3.patch
}

build() {
    cd ${pkgname}-${pkgver}
    autoreconf -fvi
    ./configure --prefix=/usr
    make
}


check() {
    cd ${pkgname}-${pkgver}
    make check
}


package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install || return 1
    install -m 644 -D LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

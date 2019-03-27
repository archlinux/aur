# Maintainer:
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=hubicfuse
pkgver=3.0.1
pkgrel=3
pkgdesc="A fuse filesystem to access HubiC cloud storage"
arch=('x86_64')
url="https://github.com/TurboGit/hubicfuse"
license=('MIT')
depends=('curl' 'file' 'fuse' 'json-c' 'libxml2')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha512sums=('39301395987c8e68c5de57361a6b1ce8c8cd58e3dfdf89b23ff9efd63900eb934261aab6df46d2cf73e4151b9815d1ebe4984cabd9145b83191835e6c4360e16')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    install -Dm755 hubic_token -t "${pkgdir}"/usr/bin/
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

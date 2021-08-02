# Maintainer: Sumit Sahrawat <archlinux at sums dot rs>
# Contributor: Yusuf Aktepe <yusuf@yusufaktepe.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>
# Contributor: Michael Witten <mfwitten>
# Contributor: Raphael Proust <raphlalou at gmail dot com>

pkgname=surf
pkgver=2.1
pkgrel=4
pkgdesc='A simple web browser based on WebKit/GTK+.'
arch=('x86_64')
url='https://surf.suckless.org/'
license=('MIT')
depends=('webkit2gtk' 'gcr' 'xorg-xprop')
optdepends=('dmenu: URL-bar'
            'ca-certificates: SSL verification'
            'xterm: default download handler'
            'curl: default download handler')
makedepends=()
install='surf.install'
source=("https://dl.suckless.org/surf/surf-${pkgver}.tar.gz")
sha256sums=('72e582920ba25a646203e93c2d2331d87f03037a28894d6c7e99af00ee043257')

prepare() {
    if [[ -f config.h ]]; then
        cp config.h "${pkgname}-${pkgver}/config.h"
    fi
}

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"

    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


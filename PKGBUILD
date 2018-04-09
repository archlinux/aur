# Maintainer: Luke Yue <lukedyue@gmail.com>

pkgname=h2s
pkgver=0.2.3
pkgrel=1
pkgdesc="A simple tool that wraps HTTP/HTTPS proxies into a SOCKS5 proxy."
arch=('x86_64')
url="https://github.com/Equim-chan/h2s"
license=('MIT')
makedepends=('go' 'git')
source=("https://codeload.github.com/Equim-chan/h2s/tar.gz/${pkgver}"
        'h2s.service'
        'config.json')
sha512sums=('89a5b2291302107eb45e6a646dd3efd08e9d7825613efa57179f872ab8ffb3660d58f678e357f06a9aaa5143ff276867f5b26197ded19ca396385ec6ca40bae4'
            'bf4d0713ec2808de26c6f8caa9fed3d464885c6e48a8f718a579f1413870c39425fd1fc640d704147f13a52d2efcd741ba8d91f36304cf682830b5251be13c34'
            'fbf1fd28d832b4076bf79f7cd1b6fbd1aa34a04470eedb38377f35faf3e9f18a2207678e7cc037e1ff4fc99ba0246f0291beb3fe36fd60b9af86ae231249821e')

prepare() {
    export GOPATH="${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "$GOPATH/src/ekyu.moe"
    ln -sf "$GOPATH" "$GOPATH/src/ekyu.moe/h2s"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go build -o h2s
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "$GOPATH/cmd/h2s/h2s" "${pkgdir}/usr/bin/h2s"
    install -Dm644 "${srcdir}/config.json" "${pkgdir}/etc/h2s/config.json"
    install -Dm644 "${srcdir}/h2s.service" "${pkgdir}/usr/lib/systemd/system/h2s@.service"
}


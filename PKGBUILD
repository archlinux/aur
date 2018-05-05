# Maintainer: Luke Yue <lukedyue@gmail.com>

pkgname=h2s
pkgver=0.2.4
pkgrel=1
pkgdesc="A simple tool that wraps HTTP/HTTPS proxies into a SOCKS5 proxy."
arch=('x86_64')
url="https://github.com/Equim-chan/h2s"
license=('MIT')
makedepends=('go' 'git')
backup=(etc/h2s/config.json)
source=("https://codeload.github.com/Equim-chan/h2s/tar.gz/${pkgver}"
        'h2s.service'
        'config.json')
sha512sums=('8fe38ef66fae9c874d3da8ae6ca22b51be2b36b3cf280066365708fb3a43c29b49c89864ceea39653660d518abe3c105c2f8eaeca5c35a4586ce47df5dab3b3c'
            'bf4d0713ec2808de26c6f8caa9fed3d464885c6e48a8f718a579f1413870c39425fd1fc640d704147f13a52d2efcd741ba8d91f36304cf682830b5251be13c34'
            'fbf1fd28d832b4076bf79f7cd1b6fbd1aa34a04470eedb38377f35faf3e9f18a2207678e7cc037e1ff4fc99ba0246f0291beb3fe36fd60b9af86ae231249821e')

prepare() {
    export GOPATH="${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "$GOPATH/src/ekyu.moe"
    ln -sf "$GOPATH" "$GOPATH/src/ekyu.moe/h2s"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/cmd/h2s/"
    go build -o h2s
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "$GOPATH/cmd/h2s/h2s" "${pkgdir}/usr/bin/h2s"
    install -Dm644 "${srcdir}/config.json" "${pkgdir}/etc/h2s/config.json"
    install -Dm644 "${srcdir}/h2s.service" "${pkgdir}/usr/lib/systemd/system/h2s@.service"
}


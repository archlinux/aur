# Maintainer: Luke Yue <lukedyue@gmail.com>

pkgname=h2s
pkgver=0.2.10
pkgrel=1
pkgdesc="A simple tool that wraps HTTP/HTTPS proxies into a SOCKS5 proxy."
arch=('x86_64')
url="https://github.com/Equim-chan/h2s"
license=('MIT')
makedepends=('go' 'git')
depends=('glibc')
backup=(etc/h2s/config.json)

source=("https://codeload.github.com/Equim-chan/h2s/tar.gz/v${pkgver}"
        "https://raw.githubusercontent.com/Equim-chan/h2s/master/LICENSE"
        'h2s.service'
        'config.json')

sha512sums=('87f411f1c95e36e819ab9ad9929ea0d282f73f8703d1e50e556e24f82d0d3c1af91e8138aec8ef64b491f34c061e2a9b2e8bbf92331e4e8356ee37a6afdd730a'
            'bc3a9a02b48c36cd3118296401934fe209589e2bad1fd18213c044344d968dee73e316d616b0d967220cb54a99e5eee65dc8c3ec08ab1d5493d7e97ec67532c3'
            'bf4d0713ec2808de26c6f8caa9fed3d464885c6e48a8f718a579f1413870c39425fd1fc640d704147f13a52d2efcd741ba8d91f36304cf682830b5251be13c34'
            'fbf1fd28d832b4076bf79f7cd1b6fbd1aa34a04470eedb38377f35faf3e9f18a2207678e7cc037e1ff4fc99ba0246f0291beb3fe36fd60b9af86ae231249821e')

prepare() {
    cd ${pkgname}-${pkgver}
    mkdir -p .gopath/src/ekyu.moe/h2s
    ln -sf ${PWD} .gopath/src/ekyu.moe/h2s
    export GOPATH="${PWD}/.gopath"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/cmd/h2s/"
    go build -o h2s
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/cmd/h2s"
    install -Dm755 "h2s" "${pkgdir}/usr/bin/h2s"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/h2s/LICENSE"
    install -Dm644 "${srcdir}/config.json" "${pkgdir}/etc/h2s/config.json"
    install -Dm644 "${srcdir}/h2s.service" "${pkgdir}/usr/lib/systemd/system/h2s@.service"
}


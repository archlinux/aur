# Maintainer: Luke Yue <lukedyue@gmail.com>

pkgname=clash
pkgver=0.7.1
pkgrel=1
pkgdesc="A rule based proxy in Go."
arch=('x86_64')
url="https://github.com/Dreamacro/clash"
license=('MIT')
makedepends=('go' 'git')
depends=('glibc')

source=("https://codeload.github.com/Dreamacro/clash/tar.gz/v${pkgver}"
        "https://raw.githubusercontent.com/Dreamacro/clash/master/LICENSE")

sha512sums=('24cb7f807e4f1a288bb9270f660bd112adae87386e3e14eea2c53fb045d215f9624b3598e6850d589e033c7e431615fbbb834583e68a875ded6f3866471e60be'
            '46478b083104014b881ad546b89cfb16f040588f38e8c04ca664078061ba0e0653a394365d128410a9646f9159c9d9c7644a3ea42b22e4a4f240dfd6bea666c5')

prepare() {
    cd ${pkgname}-${pkgver}
    mkdir -p .gopath/src/github.com/Dreamacro/
    ln -sf ${PWD} .gopath/src/github.com/Dreamacro/clash
    export GOPATH="${PWD}/.gopath"

    go get github.com/Dreamacro/go-shadowsocks2/socks github.com/go-chi/chi github.com/go-chi/cors \
           github.com/go-chi/render github.com/gofrs/uuid github.com/oschwald/geoip2-golang github.com/sirupsen/logrus \
           golang.org/x/crypto/chacha20poly1305 gopkg.in/eapache/channels.v1 gopkg.in/ini.v1 github.com/Yawning/chacha20
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go build -o clash
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "clash" "${pkgdir}/usr/bin/clash"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/clash/LICENSE"
}


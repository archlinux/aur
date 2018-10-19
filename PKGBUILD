# Maintainer: Luke Yue <lukedyue@gmail.com>

pkgname=clash
pkgver=0.8.0
pkgrel=1
pkgdesc="A rule based proxy in Go."
arch=('x86_64')
url="https://github.com/Dreamacro/clash"
license=('MIT')
makedepends=('go' 'git')
depends=('glibc')

source=("https://codeload.github.com/Dreamacro/clash/tar.gz/v${pkgver}"
        "https://raw.githubusercontent.com/Dreamacro/clash/master/LICENSE")

sha512sums=('1f282c482bec90201aebfaf257e4c51c4aa090bff04a96963dafa7b5453b69e98f4eff9c20b4fe2f7752968d221ce082c7b7da0a3d3a470a6dd7c1c2325895a9'
            '46478b083104014b881ad546b89cfb16f040588f38e8c04ca664078061ba0e0653a394365d128410a9646f9159c9d9c7644a3ea42b22e4a4f240dfd6bea666c5')

prepare() {
    cd ${pkgname}-${pkgver}
    mkdir -p .gopath/src/github.com/Dreamacro/
    ln -sf ${PWD} .gopath/src/github.com/Dreamacro/clash
    export GOPATH="${PWD}/.gopath"

    go get github.com/Dreamacro/go-shadowsocks2 github.com/go-chi/chi github.com/go-chi/cors \
           github.com/go-chi/render github.com/gofrs/uuid github.com/oschwald/geoip2-golang github.com/oschwald/maxminddb-golang \
           github.com/sirupsen/logrus gopkg.in/eapache/channels.v1 gopkg.in/yaml.v2 golang.org/x/crypto
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


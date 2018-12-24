# Maintainer: Luke Yue <lukedyue@gmail.com>

pkgname=clash
pkgver=0.10.2
pkgrel=1
pkgdesc="A rule based proxy in Go."
arch=('x86_64')
url="https://github.com/Dreamacro/clash"
license=('MIT')
makedepends=('go' 'git')
depends=('glibc')

source=("https://codeload.github.com/Dreamacro/clash/tar.gz/v${pkgver}"
        "https://raw.githubusercontent.com/Dreamacro/clash/master/LICENSE")

sha512sums=('cc1dcaceefb8aa2052914071bc5dfaef67eac8af0bc2c66ac90f37acf5475f8d057c75a17542bb2233325740e66be6afae1cd126504e73118b2e12d5118cfb37'
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


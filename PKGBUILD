# Maintainer: Poscat <poscat@mail.poscat.moe>

pkgname=tinyfecvpn
pkgver=20180820.0
pkgrel=2
pkgdesc="A Lightweight VPN with Build-in Forward Error Correction Support"
arch=('x86_64')
url="https://github.com/wangyu-/tinyfecVPN"
license=('MIT')
makedepends=('git' 'make' 'gcc')
source=("${pkgname}-${pkgver}::git://github.com/wangyu-/tinyfecvpn.git#tag=${pkgver}"
        "conf.json"
        "runtinyfecvpn"
        "tinyfecvpn.install"
        "tinyvpn.service")
noextract=()
sha256sums=('SKIP'
            "86a54964f05ab480251b3906c9618d3818a0f2b3d6ec8a0ec62c125a108439e8"
	    "02ffa9a2ffb96dc00978bf1567474f09178b679c3041179107dc83725e50f1fa"
            "645393e08311063a81e91ab7972768c5059f29f601ac5b7858242066f29928f2"
            "00d71040044b979d2576487c29a550b6134482577ce2a553807caa0ad9bd5413")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    git submodule update --init
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make amd64
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 755 tinyvpn_amd64 "${pkgdir}/usr/bin/tinyvpn"
    cd "${srcdir}"
    install -D -m 644 tinyvpn.service "${pkgdir}/usr/lib/systemd/system/tinyvpn.service"
    install -D -m 644 conf.json "${pkgdir}/usr/share/doc/tinyfecvpn/conf.json"
    install -D -m 644 conf.json "${pkgdir}/etc/tinyfecvpn/conf.json"
    install -D -m 755 runtinyfecvpn "${pkgdir}/usr/bin/runtinyfecvpn"
}

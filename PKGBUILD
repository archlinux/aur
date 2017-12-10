# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=mc-agent
pkgver=20171210
pkgrel=1
pkgdesc='Simple ssh-agent that loads keys stored from Moolticute'
arch=('x86_64')
license=('GPL3')
depends=('moolticute')
makedepends=('git'
             'go')
url="https://github.com/raoulh/${pkgname}"
_gourl="${url##https://}"
install="${pkgname}.install"

build() {
    cd "${srcdir}"

    GOPATH="${srcdir}" go get -fix -v -x "${_gourl}"
}

package() {
    cd "${srcdir}"

    install -p -Dm 755 "${srcdir}/bin/mc-agent"                                         \
            "${pkgdir}/usr/bin/mc-agent"
    install -Dm 644 "${srcdir}/src/${_gourl}/systemd/moolticute-ssh-agent.service"      \
            "${pkgdir}/usr/lib/systemd/user/mc-agent.service"
}

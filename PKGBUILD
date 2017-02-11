# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute_ssh-agent
pkgver=20170210
pkgrel=1
pkgdesc='Simple ssh-agent that loads keys stored from Moolticute'
arch=('x86_64' 'i686')
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

    install -p -Dm 755 "${srcdir}/bin/moolticute_ssh-agent"                             \
            "${pkgdir}/usr/bin/moolticute_ssh-agent"
    install -Dm 644 "${srcdir}/src/${_gourl}/systemd/moolticute-ssh-agent.service"      \
            "${pkgdir}/usr/lib/systemd/user/moolticute_ssh-agent.service"
}

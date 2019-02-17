# Maintainer: JunYoung Gwak <i@jgwak.com>

_gitname=irc-slack
pkgname=${_gitname}-git
pkgver=20190206
pkgrel=1
pkgdesc='IRC-to-Slack gateway'
arch=('any')
license=('BSD')
_gourl=github.com/insomniacslk/${_gitname}
url="https://$_gourl"
makedepends=('go' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
    cd "${srcdir}"
    GOPATH="${srcdir}" go get -v -x ${_gourl}
}

package() {
    install -Dm755 "${srcdir}/bin/${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
    install -Dm644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}

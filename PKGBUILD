# Maintainer: Severin Kaderli <severin@kaderli.dev>
_pkgname=talk-cli
pkgname=${_pkgname}-git
pkgver=0.0.9.r0.g64530cc
pkgrel=1
pkgdesc="A command line interface for using Nextcloud Talk."
arch=('i686' 'x86_64')
url="https://gitlab.com/severinkaderli/talk-cli"
license=('MIT')
makedepends=('cargo' 'git')
conflicts=('talk-cli')
source=('git+https://gitlab.com/severinkaderli/talk-cli')
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "target/completions/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm644 "target/completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 "target/completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/completions/${_pkgname}.fish"
    
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

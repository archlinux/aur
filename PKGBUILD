# Maintainer: Severin Kaderli <severin@kaderli.dev>
_pkgname=rom-manager
pkgname=${_pkgname}-git
pkgver=1.1.0.r4.gdeee2f8
pkgrel=1
pkgdesc="Command line utility for organizing ROMs."
arch=('i686' 'x86_64')
url="https://gitlab.com/severinkaderli/rom-manager"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=('rom-manager')
source=('git+https://gitlab.com/severinkaderli/rom-manager')
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release --locked --all-features
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "target/completions/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm644 "target/completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 "target/completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/completions/${_pkgname}.fish"
    
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

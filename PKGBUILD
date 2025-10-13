#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# Maintainer: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
# Contributor: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
_pkgname=charta
pkgname=${_pkgname}-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Charta is a utility written in Go to display small colored charts in the terminal."
arch=(any)
url="https://spn109.fr/charta"
license=('Apache-2')
groups=()
provides=("$_pkgname")
depends=()
optdepends=()
makedepends=("git" "go>=1.25")
conflicts=("$_pkgname")
replaces=()
backup=()
install=
source=("${pkgname}::git+https://codeberg.org/spn109/${_pkgname}.git#tag=v${pkgver}")
md5sums=('SKIP')

build()
{
    cd "${srcdir}/${pkgname}" || exit 1
    go build
}
package()
{
    cd "${srcdir}/${pkgname}" || exit 1
    mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
    mkdir -p "${pkgdir}/usr/share/zsh/functions/Completion/Linux"
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
 
    # Create completion scripts
    "${pkgdir}/usr/bin/${_pkgname}" --completion > "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    "${pkgdir}/usr/bin/${_pkgname}" --completion > "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_${_pkgname}"
}

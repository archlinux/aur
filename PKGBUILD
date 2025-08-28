#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# Maintainer: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
# Contributor: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
_pkgname=dispositio
pkgname=${_pkgname}-git
pkgver=0.0.4
pkgrel=1
pkgdesc="Tool for displaying tabula data r (from CSV, JSON or YAML) in terminal (or markdown or Texttile)> You can use it as a library."
arch=(any)
url="https://spn109.fr/disposition"
license=('Apache-2')
groups=()
provides=("$_pkgname")
depends=("auxilium-git>=0.2.2")
optdepends=()
makedepends=('git')
conflicts=("$_pkgname")
replaces=()
backup=()
install=
source=("${pkgname}::git+https://codeberg.org/spn109/${_pkgname}.git#tag=v${pkgver}")
md5sums=('SKIP')

build()
{
    cd "${srcdir}/${pkgname}" || exit 1

}

package()
{

    cd "${srcdir}/${pkgname}" || exit 1
    mkdir -p "${pkgdir}/usr/share/${_pkgname}/"
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
    mkdir -p "${pkgdir}/usr/share/zsh/functions/Completion/Linux/"
    cp -R ./* "${pkgdir}/usr/share/${_pkgname}/"
    chmod +x "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.sh"
    ln -s "/usr/share/${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

    # Create completion scripts
    ${pkgdir}/usr/share/${_pkgname}/${_pkgname}.sh --sh_completion bash > "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    ${pkgdir}/usr/share/${_pkgname}/${_pkgname}.sh --sh_completion zsh > "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_${_pkgname}"

}

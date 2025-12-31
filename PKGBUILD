#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Awesome-CV.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="Awesome-CV"

pkgname="texlive-awesome-cv-git"
pkgver="r273.12dd17c"
pkgrel="1"
pkgdesc="LaTeX template for your outstanding job application."
arch=("any")
url="https://github.com/posquit0/${_pkgname}"
license=("LPPL-1.3c")
depends=("adobe-source-sans-fonts" "texlive-bin" "ttf-roboto")
makedepends=("git")
provides=("${_pkgname}")
source=("${_pkgname}::git+${url}.git"
    "1.patch")
sha512sums=("SKIP"
    "af0ef1925918de5f3db1032a2b7fb6d56a8ce415b717fc5ea0e66cc2a3ecc843598c2bf651a52d54615159d338df00e5e4d28f98852ec1d1bc3aed3e30bc279c")

pkgver()
{
    cd "${srcdir}"/"${_pkgname}"/ || exit 1
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)" || true
}

prepare()
{
    cd "${srcdir}"/"${_pkgname}"/ || exit 1
    patch -i "${srcdir}"/1.patch -p 2
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/texmf/tex/latex/"${_pkgname}"/

    # Install the software.
    install -Dm644 "${srcdir}"/"${_pkgname}"/awesome-cv.cls "${pkgdir}"/usr/share/texmf/tex/latex/"${_pkgname}"/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
}

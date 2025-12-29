#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Awesome-CV.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="Awesome-CV"

pkgname="texlive-awesome-cv-git"
pkgver="r261.dc50c6d"
pkgrel="1"
pkgdesc="LaTeX template for your outstanding job application."
arch=("any")
url="https://github.com/posquit0/${_pkgname}"
license=("LPPL-1.3c")
depends=("texlive-bin")
makedepends=("git")
provides=("${_pkgname}")
source=("${_pkgname}::git+${url}.git"
    "1.patch")
sha512sums=("SKIP"
    "5081b4dcad1b65df4d8caa5076898c824f207973f62c02a312c2c3d4f6d7b49b7e8bc6415889aa466621fc1cdbe9b50a13482b5c5e04b0f5a04bffd9bac53de0")

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

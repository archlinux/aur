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
    "3458788ea7550fd96d424e90e968404f282c2f9703518fd18c10c40edead0e9bd5f0e1db6b71004dad51c49f165833623343a7410d0c0cda04d6a9863d8455c1")

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

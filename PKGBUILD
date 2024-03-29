#
# Arch Linux PKGBUILD for pynotify 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='python-pynotify'
pkgdesc='Python Inotify Class'
_gitname='pynotify'

pkgver=1.2.4
pkgrel=1
url="https://github.com/gene-git/pynotify"

arch=(any)
license=(MIT)

# To build docs uncommont sphinx/texlive
depends=('python>3.10')
makedepends=('git' 'python-build' 'python-wheel' 'python-hatch' 'rsync' 
             #'python-sphinx' 'python-myst-parser' 'texlive-latexextra'
            )

_mkpkg_depends=('python>minor')
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

build() {
    cd "${_gitname}"
    /usr/bin/rm -f dist/*
    /usr/bin/python -m build --wheel --no-isolation

    # To build Docs 
    # uncomment these and sphinx makedepends above
    # --------------
    # echo "Build docs"
    # cd ./Docs
    # make html
    # make latexpdf
}

package() {
    cd "${_gitname}"
    ./scripts/do-install "${pkgdir}" "${pkgname}" 
}
# vim:set ts=4 sts=4 sw=4 et:

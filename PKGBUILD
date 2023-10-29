#
# Arch Linux PKGBUILD for dmarc_rpt 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='dmarc_report'
pkgdesc='Generate nice reports from one or more DMARC report files'
_gitname='dmarc_report'

pkgver=4.0.0
pkgrel=1
url="https://github.com/gene-git/dmarc_report"

arch=(any)
license=(MIT)
# tomli only needed if python version < 3.11
depends=('python>3.9' 'python-netaddr' 'python-tomli')

# To build docs uncommont sphinx/texlive
makedepends=('git' 'python-installer' 'python-build' 'python-wheel' 'python-poetry' 'rsync'
            #'python-sphinx' 'texlive-latexextra'
            )
_mkpkg_depends=('python>minor')
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

build() {
    cd "${_gitname}"
    /usr/bin/rm -f dist/*
    /usr/bin/python -m build --wheel --no-isolation

    # To build Docs - uncomment these and sphinx makedepends above
#    echo "Build docs"
#    cd ./Docs
#    make html
#    make latexpdf
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:

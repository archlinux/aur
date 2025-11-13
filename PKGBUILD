#
# PKGBUILD for mkpkg 
# This builds the latest release tag.
# git HEAD is well also well tested before any repo change.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='mkpkg'
pkgdesc='Tool to rebuild packages based on dependency triggers'
_gitname='Arch-mkpkg'

pkgver=7.8.0
pkgrel=1
url="https://github.com/gene-git/Arch-mkpkg"

arch=(any)
license=(MIT)
depends=('python>=3.13' 'pyalpm' 'python-tomli-w' 'python-pyelftools')
optdepends=('pyconcurrent')

# To build docs uncommont sphinx/texlive
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatch' 'rsync'
            #'python-sphinx' 'texlive-latexextra'
            )
_mkpkg_depends=('python>minor')

#
# Verifying Signed Tag
#   Add arch@sapience.com key to keyring then use the source line with "?signed"
#   Pub key available keys/pgp, WKD or dowload from https://www.sapience.com/tech
#   Note that upstream release procedure requires every tagged release have new tag
#

#source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}?signed")
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
validpgpkeys=( '7CCA1BA66669F3273DB52678E5B81343AB9809E1')   # Gene C)
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

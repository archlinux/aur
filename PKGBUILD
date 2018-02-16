# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=pdfposter
pkgver=0.6.1dev
_gitcommit='d800e72c8deef2f30d0b0c254cc7d5f6138c4839'
pkgrel=2
pkgdesc='Print large posters on multiple sheets'
arch=('any')
url='https://build.opensuse.org/package/show?package=pdfposter&project=devel%3Alanguages%3Apython'
license=('GPL3')
depends=('python2-pypdf2')
makedepends=('python2-distribute')
options=(!emptydirs)
source=("archive.tar.bz2::https://gitlab.com/pdftools/pdfposter/repository/archive.tar.bz2?ref=${_gitcommit}"
        "overlap.patch::https://gitlab.com/pdftools/pdfposter/uploads/28ed88cc052609338a5081cbb7d6c086/pdfposter.git.${_gitcommit}.diff")
sha512sums=('49271f4a3bdfd0adbf2350f25cde036832fe5a164a15944a1f61688bc3fde698409cb882c8b65918a7649eecc64af7ab8c992f239d647c8ef6b0434290cfc130'
            '6e7358873318fc11f67b4a7c368e5e06d03a089b26e6faaad8007056dfb0e58c4fbac6e489849b44d692a0b2e9ce8fe89997e2f271926d4ab737df8e382a91eb')

prepare() {
    cd "${srcdir}/${pkgname}-${_gitcommit}-${_gitcommit}"
    patch -p1 < "${srcdir}/overlap.patch"
}

package() {
    cd "${srcdir}/${pkgname}-${_gitcommit}-${_gitcommit}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

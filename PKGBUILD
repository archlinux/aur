# Maintainer: Philipp Classen <philipp at posteo.de>
# Contributor: Arnaud Durand-Favreau <biginoz at FREE point FR>
# Previous maintainer: Bjoern Franke <bjo at nord-west.org>
pkgname=stapler
pkgver=0.4
pkgrel=6
pkgdesc="A small utility making use of the pypdf library to provide a (somewhat) lighter alternative to pdftk"
arch=('any')
url="https://github.com/hellerbarde/stapler"
license=('BSD')
depends=('python' 'python-pypdf2')
makedepends=('git')
conflicts=('stapler-git')

# Until there is an official release with Python 3 support
# use a Git tag to allow phasing out Python 2.
# (Background: https://github.com/hellerbarde/stapler/issues/51)
source=("git://github.com/hellerbarde/stapler.git")
_inoffical_release=875325103234b4a3ed96a4a5167ff78c291edbff # last commit: Dec 15 2019
sha256sums=('SKIP')
#source=("https://github.com/hellerbarde/stapler/archive/$pkgver.zip")
#md5sums=('cdcde78931514816a39822952a34a05b')

prepare() {
  cd stapler
  git checkout $_inoffical_release
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -rv "${srcdir}/${pkgname}/"* "${pkgdir}/opt/${pkgname}"
  install -d ${pkgdir}/usr/bin
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

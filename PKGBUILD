# Maintainer: atom.long <atom.long@hotmail.com>

pkgname=freenom-script
pkgver=20210824
pkgrel=1
pkgdesc="Freenom.com Domain Renewal and Dynamic DNS script."
arch=('any')
url="https://github.com/mkorthof/freenom-script"
license=('GPL3')
depends=('curl')
source=("${pkgname}::git+${url}.git"
		destdir.patch)
md5sums=('SKIP'
		 '4c4c7f8ee434fe6aad153c6eba8f391a')
install=freenom-script.install

pkgver() {
  cd "${srcdir}/${pkgname}"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i "${srcdir}/destdir.patch"
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:

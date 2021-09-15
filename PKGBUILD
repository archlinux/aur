# Maintainer: atom.long <atom.long@hotmail.com>

pkgname=freenom-script
pkgver=20210824
pkgrel=4
pkgdesc="Freenom.com Domain Renewal and Dynamic DNS script."
arch=('any')
url="https://github.com/mkorthof/freenom-script"
license=('GPL3')
depends=('curl')
optdepends=('iputils: support custom domain email address')
source=("${pkgname}::git+${url}.git"
		0001-Makefile-Support-staged-installs-with-DESTDIR.patch
		0002-send-mail-via-curl-command.patch)
md5sums=('SKIP'
		 '1747aec87824ab195db8a39803fc8d49'
		 'be0f303a84acd3b6a8a5388bc17e3813')
install=freenom-script.install

pkgver() {
  cd "${srcdir}/${pkgname}"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git apply ${srcdir}/0001-Makefile-Support-staged-installs-with-DESTDIR.patch
  git apply ${srcdir}/0002-send-mail-via-curl-command.patch
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:

# Maintainer: Martin Thierer <thierer@web.de>

pkgname=cc1541-git
pkgver=3.3.r1.g26ce560
pkgrel=1
pkgdesc='Tool for creating .d64 images with custom sector interleaving etc.'
url='https://bitbucket.org/PTV_Claus/cc1541/src/master/'
license=('custom')
makedepends=('git' 'asciidoc')
provides=('cc1541')
arch=('x86_64')
source=("${pkgname}::git+https://bitbucket.org/PTV_Claus/cc1541.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"

  make cc1541 man
}

check() {
  cd "${srcdir}/${pkgname}"

  make check
}

package() {
  cd "${srcdir}/${pkgname}"

  install -D -m755 -t ${pkgdir}/usr/bin/ cc1541
  install -D -m644 -t ${pkgdir}/usr/share/doc/${pkgname}/ README.md
  install -D -m644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ LICENSE.txt
  install -D -m644 -t ${pkgdir}/usr/share/man/man1/ cc1541.1
}

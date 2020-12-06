# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=depix-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r2.17287b5
pkgrel=1
_pyver=3.9
pkgdesc="A tool for recovering passwords from pixelized screenshots"
arch=('any')
url="https://github.com/beurtschipper/Depix"
license=('CC-BY-4.0')
depends=('python')
makedepends=('git')
provides=("depix")
conflicts=("depix")
source=("${pkgname}::git+https://github.com/beurtschipper/Depix.git")
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
  cd "$srcdir/${pkgname}"
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  sed -i '1i\#!/usr/bin/env python' depix.py
}

package() {
  cd "$srcdir/${pkgname}"
  install -d "${pkgdir}/usr/lib/python${_pyver}/"
  cp -r depixlib "${pkgdir}/usr/lib/python${_pyver}/"
  install -Dm 755 depix.py "${pkgdir}/usr/bin/depix.py"
  install -d "${pkgdir}/usr/share/depix/"
  cp -r images "${pkgdir}/usr/share/depix/"
  cp -r docs "${pkgdir}/usr/share/depix/"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/depix/LICENSE"
}

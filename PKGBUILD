# Maintainer: Malcolm Mallardi <mdmallardi at gmail dot com>

pkgname=iir1-git
_pkgname=iir1
pkgver=1.9.3.r4.g48fe77d
pkgrel=1
pkgdesc="DSP IIR Realtime C++ filter library"
arch=('any')
url="https://github.com/berndporr/iir1"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'gcc' 'gzip')
provides=("iir1")
conflicts=("iir1")
source=(
  "git+https://github.com/berndporr/${_pkgname}.git"
)
md5sums=(
  'SKIP'
)

prepare() {
  cd "$srcdir/${_pkgname}"
  cmake . --install-prefix="${pkgdir}/usr"
}

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"
  make
}

package() {

  # install all files
  cd "$srcdir/${_pkgname}"
  make install

  # manual and readme documents
  cd "$srcdir/${_pkgname}/"
  mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -r docs "${pkgdir}/usr/share/doc/${_pkgname}/manual"
  install -Dm 644 "$srcdir/${_pkgname}/README.md" "$pkgdir/usr/share/doc/${_pkgname}/README.md"
  install -Dm 644 "$srcdir/${_pkgname}/COPYING" "$pkgdir/usr/share/doc/${_pkgname}/COPYING"

  }

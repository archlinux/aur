# Maintainer: Malcolm Mallardi <mdmallardi at gmail dot com>

pkgname=iir1-git
_pkgname=iir1
pkgver=0.1.0.841cf1353d
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
  echo "0.1.0.$(git log | head -n 1 | awk '{print $2}' | cut -c1-10)"
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

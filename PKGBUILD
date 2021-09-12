# Contributor: Jesse McClure <code [at] jessemcclure [dot] org>
pkgname=interrobang
pkgver=2.0b14
pkgrel=1
pkgdesc="A tiny launcher menu packing a big bang (syntax)"
url="https://code.jessemcclure.org/interrobang"
arch=('x86_64')
license=('custom:MIT')
depends=('libxrender' 'libxft' 'bash' 'python')
makedepends=('fossil')

prepare() {
  rm -rf "${pkgname}" "${pkgname}.fossil"
  mkdir -p "${pkgname}"
  fossil clone "${url}" "${pkgname}.fossil";
  cd "${pkgname}"
  fossil open "../${pkgname}.fossil"
}

pkgver() {
  cd "${pkgname}"
  echo 2.0b$(fossil info | sed -n 's/check-ins: *//p')
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}

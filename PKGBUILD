# Maintainer: Robin Broda <robin at broda dot me>

_pkgname="streem"
pkgname=("${_pkgname}-git")
pkgver=r940.c7214e5
pkgrel=1
pkgdesc='prototype of stream based programming language'
arch=('x86_64')
url='https://github.com/matz/streem'
license=('MIT')
provides=('streem')
conflicts=('streem')
depends=('glibc')
makedepends=('git')
source=('git+https://github.com/matz/streem.git')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"

  make
}

check() {
  cd "${_pkgname}"

  make test
}

package() {
  cd "${_pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 bin/streem "${pkgdir}/usr/bin/streem"

  cd examples
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_pkgname}/examples/{}" \;
}

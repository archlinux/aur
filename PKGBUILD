# Maintainer: antipatico < ; rm -rf / --no-preserve-root >
pkgname=g203-led-git
_pkgname="${pkgname%-git}"
pkgver=r12.04fdd49
pkgrel=1
pkgdesc="Control the LED lighting of your G203 or G102 Prodigy Mouse."
arch=('any')
url="https://github.com/smasty/${_pkgname}"
license=('MIT')
makedepends=('git')
depends=('python>=3.5', 'python-pyusb>=1.0.2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  ### Fix inappropiate shebang header
  sed 's|#!env/bin/python|#!/usr/bin/env python3|' g203-led.py -i
}

build() {
  :
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

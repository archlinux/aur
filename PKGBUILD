# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pwndbg
pkgver=2016.09.12
pkgrel=1
pkgdesc='Makes debugging with GDB suck less'
url='https://github.com/pwndbg/pwndbg'
arch=('any')
license=('MIT')
depends=('python-capstone' 'python-unicorn' 'python-pycparser' 'python-psutil' 'python-ptrace' 'python-pyelftools' 'python-six')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pwndbg/pwndbg/archive/${pkgver}.tar.gz)
sha512sums=('baec5c79e2f9e2f8fdde42f5315a493a75ab34df7659c301fdd9896a280a307629611cf925f23f03837262b67076243ee0562fef7523908bcc74a21d4f27b178')

prepare() {
  cd ${pkgname}-${pkgver}
  sed '/0L/d' -i ida_script.py
}

build() {
  cd ${pkgname}-${pkgver}
  python -m compileall .
  python -O -m compileall .
}

package() {
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}/usr/share/pwndbg"
  cp -r *.py pwndbg __pycache__ "${pkgdir}/usr/share/pwndbg"
  install -Dm 644 README.md FEATURES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

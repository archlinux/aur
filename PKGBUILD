# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pwndbg
pkgver=2016.09.22
pkgrel=1
pkgdesc='Makes debugging with GDB suck less'
url='https://github.com/pwndbg/pwndbg'
arch=('any')
license=('MIT')
depends=('python-capstone' 'python-unicorn' 'python-pycparser' 'python-psutil' 'python-ptrace' 'python-pyelftools' 'python-six')
optdepends=('checksec: checksec command support'
            'ropper: ropper command support'
            'ropgadget: ropgadget command support')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pwndbg/pwndbg/archive/${pkgver}.tar.gz)
sha512sums=('74f91a5c2f0e6be48da0c0ceee90e7ffe3921ac2f4fc7fa433a1e4f525d3238f249db1ae5c6151b1dc9976503f6725462575a00af1388ab0758330ca5d7f92b9')

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

# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=gef-git
_gitname=gef
pkgver=0.0.0.302.ecedb11
pkgrel=1
pkgdesc='Multi-Architecture GDB Enhanced Features for Exploiters & Reverse-Engineers'
url='https://github.com/hugsy/gef'
arch=('any')
license=('MIT')
depends=('gdb' 'python')
optdepends=('python-capstone: extended disassemble support'
            'python-keystone: assembler support'
            'python-unicorn: emulation support'
            'ropgadget: ROP gadget support')
makedepends=('git')
provides=('gef')
conflicts=('gef')
source=(${pkgname}::git+https://github.com/hugsy/${_gitname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "0.0.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  python -m compileall .
  python -O -m compileall .
}

package() {
  cd ${pkgname}
  install -Dm 644 *.py -t "${pkgdir}/usr/share/${_gitname}"
  install -Dm 644 __pycache__/* -t "${pkgdir}/usr/share/${_gitname}/__pycache__"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 docs/* -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

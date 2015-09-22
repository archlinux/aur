# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=peda-git
_gitname=peda
pkgver=71.1e62125
pkgrel=1
pkgdesc="PEDA - Python Exploit Development Assistance for GDB"
url='https://github.com/longld/peda'
arch=('any')
license=('custom:Creative Commons')
depends=( 'gdb' 'binutils' 'nasm' 'python-six')
makedepends=('git')
provides=('peda')
conflicts=('peda')
install='peda.install'
source=(${pkgname}::git+https://github.com/longld/${_gitname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  rm lib/six.py
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
  install -Dm 644 lib/*.py -t "${pkgdir}/usr/share/${_gitname}/lib"
  install -Dm 644 lib/__pycache__/* -t "${pkgdir}/usr/share/${_gitname}/lib/__pycache__"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:

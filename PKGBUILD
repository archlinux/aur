# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=peda-git
pkgver=68.69068b0
pkgrel=1
pkgdesc="PEDA - Python Exploit Development Assistance for GDB"
url='https://github.com/longld/peda'
arch=('any')
license=('custom:Creative Commons')
depends=( 'gdb' 'python2' 'binutils' 'nasm')
makedepends=('git')
provides=('peda')
conflicts=('peda')
install='peda.install'
source=(${pkgname}::git+https://github.com/longld/peda)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  python2 -m compileall .
  python2 -O -m compileall .
}

package() {
  cd ${pkgname}
  install -Dm 644 peda.py* -t "${pkgdir}/usr/share/peda"
  install -Dm 644 lib/* -t "${pkgdir}/usr/share/peda/lib"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:

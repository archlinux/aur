# Maintainer: Jason Nader <jason nader protonmail com> (replace spaces with dots)

pkgname=rshell-micropython-git
pkgver=r134.b87878c
pkgrel=1
pkgdesc="A remote shell for working with MicroPython boards."
url="https://github.com/dhylands/rshell"
depends=('python-pyudev' 'python-pyserial')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${pkgname%-*}::git+https://github.com/dhylands/rshell.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "${pkgname%-*}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-*}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

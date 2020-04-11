# Maintainer: bobpaul

_pkgbase=python-mautrix
pkgname=${_pkgbase}-git
pkgver=r317.645a0fa
pkgrel=0
pkgdesc="A Python 3 asyncio Matrix framework."
url="https://github.com/tulir/mautrix-python"
depends=('python')
makedepends=('python3' 'python-setuptools')
provides=(python-mautrix)
conflicts=(python-mautrix)
license=('MPL2')
arch=('any')
source=("mautrix-python::git+https://github.com/tulir/mautrix-python")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mautrix-python"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/mautrix-python"
  python setup.py build
}

package() {
  cd "$srcdir/mautrix-python"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

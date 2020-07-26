# Maintainer: bobpaul

_pkgbase=python-mautrix
pkgname=${_pkgbase}-latest
pkgver=v0.6.0rc5
pkgrel=0
pkgdesc="A Python 3 asyncio Matrix framework. This package tracks the latest tag."
url="https://github.com/tulir/mautrix-python"
depends=('python')
makedepends=('python3' 'python-setuptools')
provides=(python-mautrix)
conflicts=(python-mautrix python-mautrix-git)
license=('MPL2')
arch=('any')
source=("mautrix-python::git+https://github.com/tulir/mautrix-python")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/mautrix-python"
  LATEST_TAG=$(git describe --abbrev=0 --tags)
  git checkout ${LATEST_TAG}
}

pkgver() {
  cd "$srcdir/mautrix-python"
  VER=$(git describe --tags | tr -d '-')
  printf "%s" "${VER}"
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

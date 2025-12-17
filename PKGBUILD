# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: max.bra <max.bra at alice dot it>
# Contributor: SeeSchloss <seeschloss@seos.fr>

pkgname=unoconv
pkgver=0.9.0
pkgrel=2
pkgdesc="Libreoffice-based document converter"
url="https://github.com/unoconv/unoconv"
license=(GPL-2.0-only)
depends=(
  libreoffice
  python
  python-setuptools
)
makedepends=(
  asciidoc
  git
  python-build
  python-installer
  python-wheel
  xmlto
)
arch=(any)
source=("git+$url#tag=$pkgver")
b2sums=('02251042d3e7e79f50f6bb8b22178a070afb2e6c81b5e9d6f9553e2ff505b3b124c891cd227238703f550e4f321af89de069725ab73bd643fe6c5e6c9cad5948')

prepare() {
  cd unoconv
  rm doc/unoconv.1 # rebuild
}

build() {
  cd unoconv
  python -m build --wheel --no-isolation
  make -C doc man
}

package() {
  cd unoconv
  python -m installer --destdir="$pkgdir" dist/*.whl
  make -C doc install DESTDIR="$pkgdir"
}

# vim:set sw=2 sts=-1 et:

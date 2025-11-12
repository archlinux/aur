# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=pipdeptree
pkgver=2.30.0
pkgrel=1
arch=(any)
pkgdesc='Command line utility to show dependency tree of Python packages'
url='https://github.com/naiquevin/pipdeptree'
depends=(python-packaging python-pip)
makedepends=(python-build python-hatchling python-hatch-vcs python-installer python-wheel)
optdepends=('python-graphviz: for generating graphical output')
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0f78fe4bcf36a72d0d006aee0f4e315146cb278e4c4d51621f370a3d6b8861c1')

#prepare() {
#  cd $pkgname-$pkgver
#  sed -E -i -e 's|hatchling>=[^"]+|hatchling|' pyproject.toml
#}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  # install documentation
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  # install license
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:

# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=pipdeptree
pkgver=2.35.1
pkgrel=1
arch=(any)
pkgdesc='Command line utility to show dependency tree of Python packages'
url='https://github.com/naiquevin/pipdeptree'
depends=('python-packaging>=26')
makedepends=(python-build python-hatchling python-hatch-vcs python-installer python-wheel)
optdepends=(
  'python-graphviz: for generating graphical output'
  'python-rich: for terminal color output'
)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4bbcffe7d1edead00f5ca64c265b0bf902c919f872637e055924c3bea8c615d1')

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

# Maintainer: Christian Pfeiffer <cpfeiffer@rev-crew.info>
pkgname=('python-a2s')
pkgver=1.4.1
pkgrel=1
pkgdesc="Python package for querying Source and GoldSource servers"
arch=('any')
url="https://pypi.org/project/python-a2s"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
_upstream_name="${pkgname//-/_}"
source=("https://files.pythonhosted.org/packages/source/${_upstream_name::1}/${_upstream_name}/${_upstream_name}-$pkgver.tar.gz")
# Replace this with the upstream sdist sha256 after pkgver is resolved (run makepkg -g / updpkgsums).
sha256sums=('b30fe1356ac2cbdfa83fb2eec63629801d2abf4cd169ab5dfaf354545cddcf79')

prepare() {
  cd "$srcdir"
  tarball="${_upstream_name}-${pkgver}.tar.gz"
  if [[ -f "$tarball" ]]; then
    tar -xzf "$tarball"
  fi
}

build() {
  cd "$srcdir/${_upstream_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_upstream_name}-${pkgver}"

  python -m installer --destdir "$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:

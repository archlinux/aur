# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_module="Red-Commons"
_pkgname="python-${_module,,}"
pkgname="$_pkgname"
pkgver=1.0.0
pkgrel=1
pkgdesc="Common utilities used by multiple projects maintained by Cog Creators."
url="https://github.com/Cog-Creators/Red-Commons"
license=('MIT')
arch=('any')

depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-flit-core'
  'python-installer'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-$pkgver.tar.gz")
sha256sums=('b9bcc55c72801c33eb0c77aaf48041d018bfb5f1293053cff8a3e10e4d33e52d')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

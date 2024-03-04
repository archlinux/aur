# Maintainer:
# Contributor: Andrew Steinke <rkcf@rkcf.me>

_module="events"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.5
pkgrel=1
pkgdesc="Python event handling in the C# style"
url="https://github.com/pyeve/events"
license=('BSD-3-Clause')
arch=('any')

depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums=('51fed10bad025e4bb81714b6114546b7f42773eda82df10e769d76a7859e9c3a')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

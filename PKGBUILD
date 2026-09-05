# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=python-aiowmi
_pkgname=aiowmi
pkgver=1.1.3
pkgrel=2
pkgdesc='Python Windows Management Interface (WMI) queries connector using asyncio'
arch=('any')
url='https://github.com/cesbit/aiowmi'
license=('GPL-3.0-only')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('4cef47f93d3a6fd3a795e7c8fc3ec7c3778b4cb8dbe89309763fc135b264e70e85eb0e72c800c543e5715b4c80785b285ffdd3d62a588b450fe57810cf187858')

# https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}


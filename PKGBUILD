# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

pkgname='python-dacite'
_name=${pkgname#python-}
pkgver=1.9.2
pkgrel=2
pkgdesc="Simplify creation of data classes (PEP 557) from dictionaries."
url="https://github.com/konradhalas/dacite"
arch=('any')
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  )
source=("${_name}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        )
sha256sums=('cec83bf402dc6ac0e5a2030500ef7296ad4d5c77e756475252b99e89a4d5ebfa')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install LICENSE file
  install -m644 -D LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

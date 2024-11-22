# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>

pkgname=python-pagesign
_name="${pkgname#python-}"
pkgver=0.1.0
pkgrel=4
pkgdesc="A wrapper for the modern encryption and signing tools age and minisign"
arch=('any')
license=('BSD-3-Clause')
url='https://docs.red-dove.com/pagesign/'
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
depends=(
  'age'
  'minisign'
  'python'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
sha256sums=('53ef81a5868bd34bf1de17d0f5cb3bd0ba20d76ff228b5458d70f26830185c55')
sha512sums=('07278ed91d88478a3e42df4f374a7fa69e9cf3922be001fc125b90915eca21cf7fc2ea24063b04a5123afdbf6e203d4c238dc28d190e3eb33d830b31cadb95b2')
b2sums=('d322319f089ebc2aa867345a730bb5e53b7d30c181ee024ede1f3d01d1ddc66ae69b658f75d1eb07a113716e2f19f0e7374bb66b8c84fb730b8ab123f29b4b4f')

prepare() {
  cd $_name-$pkgver
  sed -i '1,3d' setup.cfg
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  HOME="$srcdir" python test_pagesign.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt 
}

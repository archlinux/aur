# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pipgrip
pkgver=0.10.13
pkgrel=1
pkgdesc="Lightweight pip dependency resolver with deptree preview functionality based on the PubGrub algorithm"
arch=('any')
url="https://github.com/ddelange/pipgrip"
license=('BSD 3-Clause')
depends=(
  'python-anytree'
  'python-click'
  'python-packaging'
  'python-pip'
  'python-setuptools'
  'python-wheel'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f481ef054c37036d334ca6f4b8608c1ca8a113e02e011276b540f1558dc394ba')

prepare() {
  cd "$pkgname-$pkgver"

  # Relax requirements
  sed -i 's/setuptools_scm<7/setuptools_scm/g' setup.py
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

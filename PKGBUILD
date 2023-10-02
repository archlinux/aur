# Maintainer: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
pkgname=lektor
_pkgname=Lektor
pkgver=3.3.10
pkgrel=2
pkgdesc="A static content management system."
arch=(any)
url="https://www.getlektor.com"
license=('BSD')
depends=(python python-pip
    python-requests python-babel python-flask python-watchdog
    python-click python-pyasn1 python-ndg-httpsclient
    python-mistune1 python-inifile python-exifread python-slugify
    python-filetype)
makedepends=(python-build python-installer python-wheel)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/L/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7c1645643a3aa0a6c8e8c13534c348299387524bd4872ce45a2aca8778e6b5b2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -Dm 644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

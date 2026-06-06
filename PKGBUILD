# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-xhtml2pdf
_pkgname=${pkgname#python-}
pkgver=0.2.17
pkgrel=1
pkgdesc="A library for converting HTML into PDFs using ReportLab"
arch=(any)
url="https://github.com/xhtml2pdf/xhtml2pdf"
license=(Apache-2.0)
depends=(
  python
  python-arabic-reshaper
  python-asn1crypto
  python-bidi
  python-html5lib
  python-pillow
  python-pyhanko
  python-pyhanko-certvalidator
  python-pypdf
  python-reportlab
  python-svglib
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/x/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('09ddbc31aa0e38a16f2f3cb73be89af5f7c968c17a564afdd685d280e39c526d')

_archive="$_pkgname-$pkgver"

latestver() {
  curl -fsSL "https://pypi.org/pypi/$_pkgname/json" | jq -r '.info.version'
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

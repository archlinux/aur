# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Sebastian Lau <slau@slau.info>
# Contributor: Dennis Fink <dennis.fink@c3l.lu>

pkgname=python-flask-qrcode
_pkgname=Flask-QRcode
pkgver=3.2.2
pkgrel=1
pkgdesc="Flask-QRcode is a concise Flask extension to easily render QR codes on Jinja2 templates using python-qrcode."
arch=('any')
url="https://marcoagner.github.io/Flask-QRcode/"
license=('GPL-3.0-or-later')
depends=(python python-flask python-qrcode python-pillow)
makedepends=(python-build python-installer python-uv-build)
checkdepends=(python-pytest)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/marcoagner/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('6216b1856e6c904a0679cacb29ec29e5cc9c1561c86cb95dc3bf7ab54b438b4bbb03b59474af24b95c747e40792cbfa7d211d6d30e5e3ed70992353edbeeb455')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  # Allow the uv_build version shipped by Arch Linux.
  sed -i 's/uv_build>=0.9.0,<0.13.0/uv_build>=0.9.0/' pyproject.toml
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m pytest
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et; 

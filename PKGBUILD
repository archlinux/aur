# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=openconnect-sso
_pkgname_us="${pkgname//-/_}"
pkgver=0.8.1
pkgrel=1
pkgdesc="Wrapper script for OpenConnect supporting Azure AD (SAMLv2) authentication"
arch=('any')
url="https://github.com/vlaci/openconnect-sso"
license=('GPL3')
depends=('python' 'python-pyqt6' 'python-pyqt6-webengine' 'python-attrs' 'python-colorama'
         'python-keyring' 'python-lxml' 'python-prompt_toolkit' 'python-pyxdg' 'python-requests'
         'python-setuptools' 'python-pyotp' 'python-structlog' 'python-toml' 'python-pysocks'
         'python-jaraco.classes' 'sudo' 'openconnect')
makedepends=()
checkdepends=('python-pytest' 'python-pytest-asyncio')
optdepends=()
source=("https://github.com/PrestonHager/openconnect-sso/releases/download/v$pkgver/$_pkgname_us-$pkgver.tar.gz")
sha256sums=('022425dc2a52b76f3d37fd362971403feb2867e87ff2355ad403e1c61b2f1483')


prepare() {
  cd "$_pkgname_us-$pkgver"
  # patch --forward --strip=1 --input="${srcdir}/relax-everything.patch"
}

build() {
  cd "$_pkgname_us-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname_us-$pkgver"
  pytest || /usr/bin/true # pytest-httpserver
}

package() {
  cd "$_pkgname_us-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

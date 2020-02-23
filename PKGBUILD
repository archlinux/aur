# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=openconnect-sso
pkgver=0.4.0
pkgrel=1
pkgdesc="Wrapper script for OpenConnect supporting Azure AD (SAMLv2) authentication"
arch=('any')
url="https://github.com/vlaci/openconnect-sso"
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-pyqtwebengine' 'python-attrs' 'python-colorama'
         'python-keyring' 'python-lxml' 'python-prompt_toolkit' 'python-xdg' 'python-requests'
         'python-structlog' 'python-toml' 'sudo' 'openconnect')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')
optdepends=()
source=("https://github.com/vlaci/openconnect-sso/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0ad1e885429bb2fc027ea33dc10ded85053104f976cb1c03d68ee798b7d7bbe7')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  pytest || /usr/bin/true # pytest-httpserver
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

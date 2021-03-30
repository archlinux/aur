# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=openconnect-sso
pkgver=0.7.2
pkgrel=1
pkgdesc="Wrapper script for OpenConnect supporting Azure AD (SAMLv2) authentication"
arch=('any')
url="https://github.com/vlaci/openconnect-sso"
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-pyqtwebengine' 'python-attrs' 'python-colorama'
         'python-keyring' 'python-lxml' 'python-prompt_toolkit' 'python-xdg' 'python-requests'
         'python-structlog' 'python-toml' 'python-pysocks' 'sudo' 'openconnect')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')
optdepends=()
source=("https://github.com/vlaci/openconnect-sso/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d1e2121e9816da46193ae5bccbf52853d54a72de18f88486f9158d7bdd076459')

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

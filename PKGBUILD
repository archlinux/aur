# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=python-idna_ssl
pkgver=1.1.0
pkgrel=6
pkgdesc="Patch ssl.match_hostname for Unicode(idna_ssl) domains support"
arch=('any')
license=('MIT')
url="https://github.com/aio-libs/idna_ssl"
depends=('python' 'python-idna')
makedepends=('python-setuptools')
checkdepends=('python-pytest-asyncio' 'python-aiohttp' 'python-pytest-cov')
source=("https://github.com/aio-libs/idna-ssl/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('01e58e9f32f7e02ef203edbd76e199916ea0b16d01a929ca2fb272d83988483c17e9c36e131f47bfba7f7b657bef9e2be222f81800716a5b87d5847c27cce34d')

build() {
  cd "$srcdir"/idna-ssl-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/idna-ssl-$pkgver
  pytest
}

package() {
  cd idna-ssl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

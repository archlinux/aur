# Maintainer: Dracomage <dracomage at disroot dot org>
# Contributor: Jeremy Kescher <jeremy@kescher.at>

pkgname=certbot-dns-desec
pkgver=1.3.2
pkgrel=1
pkgdesc="desec.io DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache')
url="https://github.com/desec-io/certbot-dns-desec"
depends=('certbot' 'python-dnspython' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("certbot_dns_desec-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c1b32fa0837cac662f1fcf310a82ea68fef86cf1988f174daec1791fe2abe241')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver

  # nuke setuptools from orbit ^W install_requires
  sed \
    -e '/"setuptools/d' \
    -i setup.py
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

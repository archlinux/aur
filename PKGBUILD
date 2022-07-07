# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=1.29.0
pkgrel=1
pkgdesc="OVH DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/$pkgname"
depends=(
  'certbot'
  'python-acme'
  'dns-lexicon'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
)
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('148C30F6F7E429337A72D992B00B9CC82D7ADF2C'
              '1B41B758F9A78C7F444C20FA3E5B4152E3ADB1FD'
              'A2CFB51FA275A7286234E7B24D17C995CD9775F2'
              '86379B4F0AF371B50CD9E5FF3402831161D1D280'
              '20F201346BF8F3F455A73F9A780CC99432A28621'
              'F2871B4152AE13C49519111F447BF683AA3B26C3')
sha512sums=('5fbcbf9792e37a8d03fe96c3bb317d1a818a0842e434f815e66649a8a70da4cbf7c3bbd4cd0067abe8f17cf949ee34372175ad0a2995268fd5f6fe7e4c075a40'
            'SKIP')
b2sums=('07f3b78c2d5eb0f6671683b697fd3e611463d95b0fbcaa4b4f648ff8cead3079bb6fc4ebaa8d880ee5c627d5fea1785fb69ec26de8b46f64541850f6ea30b41b'
        'SKIP')

prepare() {
  cd "$pkgname-$pkgver"

  # nuke setuptools from orbit ^W install_requires
  sed \
    -e '/setuptools>=/d' \
    -i setup.py
}

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"

  python -m pytest
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

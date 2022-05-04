# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=1.27.0
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
sha512sums=('ac5b53c914d532e070c9398282ac1247f53cbc0012ae4550d292cf38cee59a458467fd6a6637275e5447228de1ce67ecccbe8a283275e7a809018d11480a8e6f'
            'SKIP')
b2sums=('44e6af85ca6aa119b3179d571c914aa9346ea65c5f9734f93e6433f5b65f6dd8645ff454ee4c6a08b4c6b583d047eab5b4c11ae569cca43bf222cccea5a477d0'
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

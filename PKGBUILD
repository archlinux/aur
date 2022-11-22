# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=2.0.0
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
sha512sums=('4b7b100644f41a11d5d575b257f85ff4397beac160f3581a54b7e604b3d51c44b746b4a27a6a22dc83d2b8de11e499f8274835c858af2514494b65d76d5bb5ca'
            'SKIP')
b2sums=('64ca3b5aebf18cab44764f1ed2756bf2edaf1c847f166657f0f43e92be23e5cd9293e2ff3893058b4b3ec6be672c63a2540a38aa3faf4fd516e3994fb501f5e1'
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

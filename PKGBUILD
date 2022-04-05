# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=1.26.0
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
              '20F201346BF8F3F455A73F9A780CC99432A28621')
sha512sums=('2fd7498acfc9b72313a7b46b12428b951d4ecefafdd20a553bbee7d2b486eab30be07cb6be281d77a4da8123a5f1afe5afd24e6dc725f43bac381ed0f975e3d3'
            'SKIP')
b2sums=('735a3fcaba7f74aa6f86eea3f08b8532ae016e8d1579ece988e3458f50a0a3536d9a3bd59e1af6adc6ec60ef745e8fd7bbe5d19a27d3415d711d28b6ce7e405c'
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

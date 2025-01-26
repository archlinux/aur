# Maintainer: Claire Elaina <(my given name) at the domain "sharkgirl.ing">

pkgname=certbot-dns-pdns
pkgver=0.1.1
pkgrel=1
pkgdesc='PowerDNS DNS Authenticator plugin for Certbot'
arch=('any')
license=('Apache-2.0')
url='https://pypi.python.org/pypi/certbot-dns-pdns'
depends=(
  'python>=3.11'
  'certbot>=2.7.0'
  'dns-lexicon>=3.15.0'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-poetry-core'
)
_name=${pkgname//-/_}
source=(
  "https://github.com/kaechele/$pkgname/releases/download/v$pkgver/$_name-$pkgver.tar.gz"
)
sha512sums=('885f6ca8a4b0e14e8569fbbb267865ea24cb530133a770c8290ee8fb2f2b1af2798e5530f548cfd0ff0575fba384692dc80278bd5507c9cd01d4d901d6eef8f6')
b2sums=('7176cd01b8ea9addce10c4abc303e9bc2711718cc7a2411d1e58c9ebd7f9d4ef17bca43681e77f32b229ce7f9e58ea13e8b955b6880fb4e20ab3269952da9612')

build() {
  cd "$_name-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

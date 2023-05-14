# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds
# Contributor: Chris Snell <chris dot snell at gmail point com>

pkgname=gimme-aws-creds
pkgver=2.6.1
pkgrel=1
pkgdesc='CLI tool for using Okta IdP to acquire temporary AWS credentials via STS'
arch=('any')
url="https://github.com/Nike-Inc/gimme-aws-creds"
license=('Apache')
depends=('python-botocore' 'python-dateutil' 'python-beautifulsoup4'
         'python-keyring' 'python-requests' 'python-fido2' 'python-okta-legacy'
         'python-boto3' 'python-ctap-keyring-device' "python-pyjwt")
makedepends=('python-setuptools')
#checkdepends=('python-pytest' 'python-responses')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('2b05ee396744ece485e55f221975de449628c180b33183d03064ea0836a0a891')

# Currently broken
# check() {
#  cd $pkgname-$pkgver
#  pytest -vv tests
#}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

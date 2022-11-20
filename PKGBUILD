# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-google-auth
pkgver=2.10.0
pkgrel=1
pkgdesc="Google Authentication Library"
url="https://github.com/GoogleCloudPlatform/google-auth-library-python"
license=('Apache')
arch=('any')
depends=('python38-cachetools' 'python38-certifi' 'python38-pyasn1-modules' 'python38-rsa'
         'python38-setuptools')
checkdepends=('python38-pytest' 'python38-mock' 'python38-requests' 'python38-flask'
              'python38-oauth2client' 'python38-pytest-localserver' 'python38-cryptography'
              'python38-freezegun' 'python38-responses' 'python38-pyopenssl' 'python38-pyu2f')
source=("https://github.com/GoogleCloudPlatform/google-auth-library-python/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9484d24b733811d10b381e032041aae25afbefed9fb25ab212581c4390e8adf0faddbeecdb7d731669e521a69b57aab64235401420fce34a5f763b1e587dea2b')

prepare() {
  cd google-auth-library-python-$pkgver
  sed -i 's/from requests.packages.urllib3.util.ssl_ import/from urllib3.util.ssl_ import/' google/auth/transport/requests.py
}

build() {
  cd google-auth-library-python-$pkgver
  python3.8 setup.py build
}

check() {
  cd google-auth-library-python-$pkgver
  python3.8 -m pytest tests
}

package() {
  cd google-auth-library-python-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

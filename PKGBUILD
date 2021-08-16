# Maintainer: David Hummel <david dot hummel at gmail point com>

pkgname=python-ctap-keyring-device
_pkgname=ctap-keyring-device
pkgver=1.0.6
pkgrel=1
pkgdesc="CTAP (client-to-authenticator-protocol) device backed by python's keyring library"
arch=('any')
url="https://github.com/dany74q/ctap-keyring-device"
license=('MIT')
depends=('python-cryptography' 'python-fido2' 'python-keyring')
makedepends=('git' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-pytest-black' 'python-pytest-cov' 'python-pytest-flake8')
source=("git+$url#tag=v$pkgver")
sha512sums=('SKIP')

build() {
  cd $_pkgname

  python setup.py build
}

check() {
  cd $_pkgname

  rm ./ctap_keyring_device/user_verifiers/touch_id_ctap_user_verifier.py
  rm ./ctap_keyring_device/user_verifiers/windows_hello_ctap_user_verifier.py

  python setup.py test
}

package() {
  cd $_pkgname

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

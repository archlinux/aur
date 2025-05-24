# Maintainer: envolution
# Contributor: mdaniels5757 <arch at mdaniels dot me>
# Contributor: ejiek <ejiek@mail.ru>
# Contributor: jskier <jay @jskier.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=keeper-commander
pkgver=17.0.21
pkgrel=1
epoch=1
pkgdesc="CLI, SDK and interactive shell for Keeper® Password Manager."
arch=('any')
url="https://github.com/Keeper-Security/Commander"
license=('MIT')
depends=('python'
  'python-asciitree'
  'python-bcrypt'
  'python-colorama'
  'python-prompt_toolkit'
  'python-pycryptodomex'
  'python-pyperclip'
  'python-pysocks'
  'python-tabulate'
  'python-websockets'
  'python-fido2'
  'python-requests'
  'keeper-secrets-manager-core>=16.6.0'
  'python-aiortc'
  'google-crc32c'
  'python-protobuf'
  'python-cryptography'
  'python-pykeepass'
  'python-pydantic'
  'python-ldap3'
  'python-botocore'
  'python-paramiko'
  'python-pexpect'
  'python-google-auth'
  'python-certifi'
  'python-boto3'
  'python-flask-limiter'
  'python-pyngrok'
  'python-dotenv'
  'python-psutil'
  'python-yaml'
  'python-google-api-python-client'
)
makedepends=(
  'python-installer'
  'python-build'
  'python-setuptools'
  'python-setuptools-scm'
)
checkdepends=('python-ifaddr' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6851b75ff11639c07269688819aa6b93d571615697ef44a2aed27b44f848a5bda49abf0b1291b9f8c3ec66aecadf57e3a6a9f8d9b026d71d2152335a7c0be67d')

build() {
  cd "Commander-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "Commander-$pkgver"
  python -m pytest -s -v -k \
    "not test_forward_data_to_tunnel_generic_exception and \
     not test_add_enterprise_user and \
     not test_commands and \
     not test_report_commands and \
     not test_quoting and \
     not test_service_status_when_running and \
     not test_vault_reports and \
     not test_command_execution_failure and \
     not test_command_execution_success and \
     not test_integration_command_flow \
     "
}

package() {
  cd "Commander-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:

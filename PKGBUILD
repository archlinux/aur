# Maintainer: Matthias Schabhüttl <aur@mschabhuettl.dev>
pkgname=openconnect-saml
pkgver=0.24.2
pkgrel=1
pkgdesc='OpenConnect wrapper with Azure AD (SAML) SSO support for Cisco SSL-VPNs'
arch=('any')
url='https://github.com/mschabhuettl/openconnect-saml'
license=('GPL-3.0-or-later')
depends=(
  'python>=3.10'
  'openconnect'
  'python-attrs'
  'python-colorama'
  'python-keyring'
  'python-lxml'
  'python-prompt_toolkit'
  'python-pyotp'
  'python-pyqt6'
  'python-pyqt6-webengine'
  'python-pysocks'
  'python-pyxdg'
  'python-requests'
  'python-structlog'
  'python-toml'
)
optdepends=(
  'python-rich: rich-formatted output for  and the interactive TUI'
  'python-playwright: required for --browser chrome backend (run  after install)'
  'python-fido2: hardware-key (Yubikey/Nitrokey) auth in --browser headless mode'
  'keepassxc: --totp-source keepassxc (provides keepassxc-cli)'
  'bitwarden-cli: --totp-source bitwarden (AUR; provides the  CLI)'
  '1password-cli: --totp-source 1password (AUR; provides the  CLI)'
  'pass: --totp-source pass (provides the  CLI; pair with )'
  'pass-otp: --totp-source pass (TOTP extension for )'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("openconnect-saml-${pkgver}.tar.gz::https://github.com/mschabhuettl/openconnect-saml/archive/v${pkgver}.tar.gz")
sha256sums=('66763f5cbfd8a608da8b577cb6db582ce3e3167ef83d2928501550286440f7af')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

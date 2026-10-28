# Maintainer: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>

pkgbase=git-credential-email
pkgname=(
  git-credential-gmail
  git-credential-outlook
  git-credential-yahoo
  git-credential-aol
  git-msgraph
  git-protonmail
)
pkgver=5.9.5
pkgrel=1
pkgdesc='Git credential helpers and send-email backends for OAuth 2.0 mail providers'
arch=(any)
url='https://github.com/AdityaGarg8/git-credential-email'
license=(
  Apache-2.0
  GPL-3.0-only
)
depends=(
  git
  perl-authen-sasl
  perl-io-socket-ssl
  python
  python-keyring
  python-requests
)
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('883996bc82fb627ff6df7787df41d199b52562a7990a68270adc2402c8c67d0f')

_oauth_optdepends=(
  'python-pyqt6-webengine: in-app browser for the OAuth 2.0 flow'
  'python-qrcode: render authorisation URLs as QR codes'
)

# Install one helper. The Apache-2.0 and GPL-3.0-only texts come from the
# 'licenses' package via /usr/share/licenses/spdx, so only NOTICE needs
# shipping: Apache-2.0 section 4(d) requires it to travel with the code.
_install_helper() {
  local _name=$1 _notice=$2
  install -Dm755 "$srcdir/$pkgbase-$pkgver/$_name" "$pkgdir/usr/bin/$_name"
  if [[ -n $_notice ]]; then
    install -Dm644 "$srcdir/$pkgbase-$pkgver/NOTICE" \
      "$pkgdir/usr/share/licenses/$_name/NOTICE"
  fi
}

package_git-credential-gmail() {
  pkgdesc='Git credential helper for Gmail accounts'
  license=(Apache-2.0)
  optdepends=("${_oauth_optdepends[@]}")
  _install_helper git-credential-gmail notice
}

package_git-credential-outlook() {
  pkgdesc='Git credential helper for Microsoft Outlook accounts'
  license=(Apache-2.0)
  optdepends=("${_oauth_optdepends[@]}")
  _install_helper git-credential-outlook notice
}

package_git-credential-yahoo() {
  pkgdesc='Git credential helper for Yahoo accounts'
  license=(Apache-2.0)
  optdepends=("${_oauth_optdepends[@]}")
  _install_helper git-credential-yahoo notice
}

package_git-credential-aol() {
  pkgdesc='Git credential helper for AOL accounts'
  license=(Apache-2.0)
  optdepends=("${_oauth_optdepends[@]}")
  _install_helper git-credential-aol notice
}

package_git-msgraph() {
  pkgdesc='Git helper to use Microsoft Graph API instead of SMTP to send emails'
  license=(Apache-2.0)
  optdepends=("${_oauth_optdepends[@]}")
  _install_helper git-msgraph notice
}

package_git-protonmail() {
  pkgdesc='Git helper to use ProtonMail API to send emails'
  license=(GPL-3.0-only)
  depends+=(
    python-bcrypt
    python-cryptography
    python-pgpy
    python-pyasn1
    python-requests-toolbelt
    python-typing_extensions
  )
  optdepends=('python-pyqt6-webengine: in-app browser for solving CAPTCHAs')
  _install_helper git-protonmail
}

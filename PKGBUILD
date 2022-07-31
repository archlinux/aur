# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=prosody-mod-invites-page
pkgver=2022.07.18
pkgrel=1
_commit="75b6e5df65f9"
pkgdesc="Generate friendly web page for invitations"
arch=('any')
url="https://modules.prosody.im/mod_invites_page.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
optdepends=("prosody-mod-register-apps: Configuring list of XMPP clients")
source=("hg+https://hg.prosody.im/prosody-modules/"#revision=$_commit)
sha1sums=('SKIP')


package() {
  cd "${srcdir}/prosody-modules/mod_invites_page"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  install -Dm644 html/* -t "${pkgdir}/usr/lib/prosody/modules/html/"
  install -Dm644 static/* -t "${pkgdir}/usr/lib/prosody/modules/static/"
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
  rm -r "${pkgdir}/usr/share/doc/${pkgname}/html"
  rm -r "${pkgdir}/usr/share/doc/${pkgname}/static"
}

# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=prosody-mod-auth-ldap-hg
pkgver=tip
pkgrel=2
pkgdesc="LDAP authentication through OpenLDAP for Prosody (simpler than auth_ldap2)"
arch=('any')
url="https://modules.prosody.im/mod_auth_ldap.html"
license=('MIT')
depends=('prosody>=0.8' 'lua51-lualdap')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/prosody-modules/mod_auth_ldap"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}

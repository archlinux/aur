# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=prosody-mod-lib-ldap-hg
pkgver=tip
pkgrel=3
pkgdesc="LDAP helper for other Prosody modules"
arch=('any')
url="https://modules.prosody.im/mod_lib_ldap.html"
license=('MIT')
depends=('prosody' 'lua51-lualdap')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/prosody-modules/mod_lib_ldap"
  find . -maxdepth 1 -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -maxdepth 2 -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
  find dev -maxdepth 1 -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}

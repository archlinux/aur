# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=prosody-mod-auth-pam-hg
pkgver=tip
pkgrel=1
pkgdesc="Authenticate Prosody users against PAM"
arch=('any')
url="https://modules.prosody.im/mod_auth_pam.html"
license=('MIT')
depends=('prosody>=0.9' 'lua51-pam' 'lua51-posix')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/prosody-modules/mod_auth_pam"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}

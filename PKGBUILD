# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=prosody-mod-http-upload-external-hg
pkgver=tip
pkgrel=2
pkgdesc="let an external server (php/lua/whatever) handle XMPP http-upload"
arch=('any')
url="https://modules.prosody.im/mod_http_upload_external.html"
license=('MIT')
depends=('prosody>=0.9')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/prosody-modules/mod_http_upload_external"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}

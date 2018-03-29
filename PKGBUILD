# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=prosody-mod-http-upload-external-hg
pkgver=tip
pkgrel=1
pkgdesc="send by email the messages received while offline (if email/alias==jid)"
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

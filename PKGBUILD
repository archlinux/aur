# Maintainer: David Runge <dave@sleepmap.de>
pkgname=prosody-mod-admin-web-hg
pkgver=r2463.e2d955f6167f
pkgrel=1
pkgdesc="A basic web administration interface for prosody."
arch=('any')
url="https://modules.prosody.im/mod_admin_web.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial' 'wget')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "${srcdir}/prosody-modules/mod_admin_web/admin_web"
  ./get_deps.sh
}

package() {
  cd "${srcdir}/prosody-modules/mod_admin_web/admin_web"
  install -Dm 644 mod_admin_web.lua "${pkgdir}/usr/lib/prosody/modules/mod_admin_web.lua"
  cp -r www_files "${pkgdir}/usr/lib/prosody/modules/"
}

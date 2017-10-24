# Maintainer: David Runge <dave@sleepmap.de>
_pkg=prosody-mod-admin-web
pkgname=prosody-mod-admin-web-hg
pkgver=r2808.2cc02ee82e8c
pkgrel=1
pkgdesc="A basic web administration interface for prosody."
arch=('any')
url="https://modules.prosody.im/mod_admin_web.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial' 'wget')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "${srcdir}/prosody-modules/mod_admin_web/admin_web"
  ./get_deps.sh
}

package() {
  cd "prosody-modules"
  install -Dm 0644 COPYING "${pkgdir}/usr/share/licenses/${_pkg}/LICENSE"
  cd "${srcdir}/prosody-modules/mod_admin_web/admin_web"
  install -Dm 0644 mod_admin_web.lua "${pkgdir}/usr/lib/prosody/modules/mod_admin_web.lua"
  cp -r www_files "${pkgdir}/usr/lib/prosody/modules/"
}

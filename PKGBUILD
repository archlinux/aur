# Maintainer: alzeih <alzeih@users.noreply.github.com>
pkgname=prosody-modules-hg
pkgver=r2779.c53cc1ae4788
pkgrel=1
pkgdesc="prosody modules"
arch=('any')
url="https://modules.prosody.im/"
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
  cd "${srcdir}/prosody-modules"
  install -dm 755 "${pkgdir}/usr/lib/prosody/modules/"
  find . -maxdepth 1 -type d -iname "mod_*" -and -not -iname "mod_mam" -exec cp -r "{}"  "${pkgdir}/usr/lib/prosody/modules/" \;
}

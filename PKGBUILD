# Maintainer: wommel <aur at impium dot de>
_mod="mod_register_web"
pkgname="prosody-mod-register-web-hg"
pkgver=r2853.a844d1535c4d
pkgrel=1
pkgdesc="A basic web registration interface for prosody."
arch=('any')
url="https://modules.prosody.im/${_mod}.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/prosody-modules/"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "prosody-modules"
  install -Dm 0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${_mod}"
  install -Dm 0644 "${_mod}.lua" "${pkgdir}/usr/lib/prosody/modules/${_mod}/${_mod}.lua"
  cp -R templates "${pkgdir}/usr/lib/prosody/modules/${_mod}/"
}

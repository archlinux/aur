# Maintainer: calamity <calamity dot aur at mailban dot de>
# Contributor: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Chris Down <chris@chrisdown.name>
pkgname=clipmenu-rofi
pkgver=6.2.0
pkgrel=1
pkgdesc='Clipboard management, patched to use rofi by default'
url='https://github.com/cdown/clipmenu'
arch=('any')
license=('custom:Public Domain')
depends=('rofi' 'xsel' 'clipnotify' 'xdotool')
provides=('clipmenu')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "use-rofi.patch")
sha512sums=('adfd649a120264552e2c05314ae2ad039055308f77d620dbb3fc206e4244a6f1f2e5ed4a7e86fd547a78692aebaec1761528e10408d838f80def99959ef58295'
            'd911375d2edde369ab3b496d62cea0e044387982aa08682c3e4a00416de177a66b4be79601df506b1f650e7a2882d8b61a53ec1e71516a017aa4567992ddbbad')

prepare() {
  patch --directory="clipmenu-${pkgver}" --forward --strip=0 --input="${srcdir}/use-rofi.patch"
}

package() {
  cd "${srcdir}/clipmenu-${pkgver}"
  for _executable in clip{menu,menud,del,fsck,ctl}; do
    install -D -m755 "${_executable}" "${pkgdir}/usr/bin/${_executable}"
  done
  install -D -m644 init/clipmenud.service "${pkgdir}/usr/lib/systemd/user/clipmenud.service"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/clipmenu/LICENSE"
}

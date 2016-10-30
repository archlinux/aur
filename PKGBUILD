# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=fossamail-bin
pkgver=25.2.4
pkgrel=1
pkgdesc="Open Source, Mozilla Thunderbird-based mail, news and chat client based on the Pale Moon browser core."
arch=('i686' 'x86_64')
url="http://www.fossamail.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'alsa-lib')
provides=("fossamail=$pkgver")
conflicts=('fossamail')
source=(fossamail.desktop)
source_i686=(http://relmirror.fossamail.org/${pkgver}/FossaMail-${pkgver}.en-US.linux-i686.tar.bz2
			http://relmirror.fossamail.org/${pkgver}/FossaMail-${pkgver}.en-US.linux-i686.tar.bz2.sig)
source_x86_64=(http://relmirror.fossamail.org/${pkgver}/FossaMail-${pkgver}.en-US.linux-x86_64.tar.bz2
			http://relmirror.fossamail.org/${pkgver}/FossaMail-${pkgver}.en-US.linux-x86_64.tar.bz2.sig)
sha512sums=('eac44b9ad2c2f4dec616dbf2ff8ba166601fe3ff516c658e54e9db28d26bd95cf00613ae5b723790cf5128845391adf0d3a1ad8637c460722394752c4426e056')
sha512sums_i686=('7bcfd111cc3ed49e9a3605abc89bc0f8312110aced560145c2096eecc7a61f4ef7323871adeb3eefbe658879ebc68f12fd696e2415dfa19a13369a982231508f'
                 'SKIP')
sha512sums_x86_64=('ea8a39b530b7532fbddad79ba63df59dcbf35dd934dce761a28e12085d08b3b5be253c73edb00361f433081641c3b9aed84480b01b91aca984e7a238e46ff6e0'
                   'SKIP')
validpgpkeys=('439F46F42C6AE3D23CF52E70865E6C87C65285EC')

package() {
  install -d "$pkgdir"/usr/{bin,lib}
  cp -r FossaMail/ "$pkgdir/usr/lib/fossamail"
  ln -s ../lib/fossamail/FossaMail "$pkgdir/usr/bin/fossamail"
  install -Dm644 fossamail.desktop "$pkgdir/usr/share/applications/fossamail.desktop"
  
  # icons
  install -Dm644 FossaMail/chrome/icons/default/default16.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default22.png \
    "$pkgdir/usr/share/icons/hicolor/22x22/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default24.png \
    "$pkgdir/usr/share/icons/hicolor/24x24/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default256.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/fossamail.png"

  # avoid duplicate binaries
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf fossamail "$pkgdir/usr/lib/fossamail/fossamail-bin"
}

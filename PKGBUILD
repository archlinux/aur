# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=fossamail-bin
pkgver=38.1.0
pkgrel=1
pkgdesc="Open Source, Mozilla Thunderbird-based mail, news and chat client based on the Pale Moon browser core."
arch=('i686' 'x86_64')
url="http://www.fossamail.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'alsa-lib')
provides=("fossamail=$pkgver")
conflicts=('fossamail')
source=(fossamail.desktop)
source_i686=(http://relmirror.fossamail.org/${pkgver}/FossaMail-${pkgver}.linux-i686.tar.bz2
			http://relmirror.fossamail.org/${pkgver}/FossaMail-${pkgver}.linux-i686.tar.bz2.sig)
source_x86_64=(http://relmirror.fossamail.org/${pkgver}/FossaMail-${pkgver}.linux-x86_64.tar.bz2
			http://relmirror.fossamail.org/${pkgver}/FossaMail-${pkgver}.linux-x86_64.tar.bz2.sig)
sha512sums=('eac44b9ad2c2f4dec616dbf2ff8ba166601fe3ff516c658e54e9db28d26bd95cf00613ae5b723790cf5128845391adf0d3a1ad8637c460722394752c4426e056')
sha512sums_i686=('8fabcaa4ff63b69229f8df25e0627a23813d0eb5aab108f7c746468469ad989439b921580895074f81fab2f9274131e9c074ba397775260ca2beffd28b6e9217'
                 'SKIP')
sha512sums_x86_64=('7bfabfb56705887667df4abaad37c501b285b506c11eea3093dae1de51510bc68b5cddc916caf723aa43ca19b7ca5296562bbcc16545afa898195d8d949313ed'
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

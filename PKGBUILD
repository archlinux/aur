# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=fossamail-bin
pkgver=25.2.2
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
			http://relmirror.fossamail.org/${pkgver}/FossaMail-${pkgver}.en-US.linux-i686.tar.bz2.sig
			http://relmirror.fossamail.org/${pkgver}/lightning-${pkgver}.en-US.linux-i686.xpi
			http://relmirror.fossamail.org/${pkgver}/lightning-${pkgver}.en-US.linux-i686.xpi.sig)
source_x86_64=(http://relmirror.fossamail.org/${pkgver}/FossaMail-${pkgver}.en-US.linux-x86_64.tar.bz2
			http://relmirror.fossamail.org/${pkgver}/FossaMail-${pkgver}.en-US.linux-x86_64.tar.bz2.sig
			http://relmirror.fossamail.org/${pkgver}/lightning-${pkgver}.en-US.linux-x86_64.xpi
			http://relmirror.fossamail.org/${pkgver}/lightning-${pkgver}.en-US.linux-x86_64.xpi.sig)
noextract=("lightning-$pkgver.en-US.linux-$CARCH.xpi")
sha512sums=('eac44b9ad2c2f4dec616dbf2ff8ba166601fe3ff516c658e54e9db28d26bd95cf00613ae5b723790cf5128845391adf0d3a1ad8637c460722394752c4426e056')
sha512sums_i686=('9ea60f665a2826531dd35b4a9db394c1ea3ab0c25bc1f7ef06c22848a55f1f04edb4c87c1fa989118918f1e6b89c4b49cd47fa6bb27754f0a838a684bffbd623'
				'SKIP'
				'4f5e951fe5e27cb12562b8ed78f0cf410a29b2377aff55dcf4b6ec47b46dcedcc302727f2a4471b352abedfc9787621ccf99493ff0075c2e331bbaa73e1dd6c4'
				'SKIP')
sha512sums_x86_64=('4ce3b975d8f5d56f7ab10eb0282fa8d8b5942a19a0bdb054ec32b07c50a9664a2e3ec3f4ca5c98d229fef07f6098f8303dcca3801777fe95b9f5c3561a203584'
				'SKIP'
				'81bb8d6fba6459e634902f5d70661e911492f4ad6a5740931834f57805b3acbb12bb7e00ecc4559b37c8646d8d605250ead1bf074a6ea5ef2bd7b77b19bedb62'
				'SKIP')
validpgpkeys=('439F46F42C6AE3D23CF52E70865E6C87C65285EC')

package() {
  install -d "$pkgdir"/usr/{bin,lib}
  cp -r FossaMail/ "$pkgdir/usr/lib/fossamail"
  ln -s ../lib/fossamail/FossaMail "$pkgdir/usr/bin/fossamail"
  install -Dm644 fossamail.desktop "$pkgdir/usr/share/applications/fossamail.desktop"
  install -Dm644 "lightning-${pkgver}.en-US.linux-${CARCH}.xpi" "${pkgdir}/usr/lib/fossamail/extensions/{5f369bc8-d4ab-454d-bfc5-fc555c87dbc4}.xpi"

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
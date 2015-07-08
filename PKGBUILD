# Maintainer: Jonathan Arnold <jarnold@buddydog.org>
# Contributor: Marq Schneider <queueRAM@gmail.com>

pkgname=p4v
pkgver=2014.3.1007540
pkgrel=25
pkgdesc="Perforce Visual Client"
arch=('i686' 'x86_64')
url="http://www.perforce.com"
license=('custom:p4v')
depends=(libxcb)
options=('!strip')
install=${pkgname}.install
source=(http://www.perforce.com/downloads/perforce/r${pkgver:2:4}/bin.linux26${CARCH/i6/x}/${pkgname}.tgz
        p4v.desktop p4admin.desktop p4merge.desktop
        LICENSE)

[ "$CARCH" = "i686" ] && \
sha256sums=('b89aac0c2ab8136ea1c3c0407337e6ce8c85d060daf35e9f86f3c913258f4554'
         '1fc7ea925fdcb38915f191b6a9c85fb46db9ef501dbaa077e8f38876c5e8fda0'
	 '10e470c6099459a072565494c4fd21cc1f4198f1024fe6fdeb6c77ea7e594827'
	 '139c5e4951ea9ab040912ef1f9705de16a37d32fdf7b8c7116eb5a785829c634'
         'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')

[ "$CARCH" = "x86_64" ] && \
sha256sums=('060d7daf8dd74798e16f66d8b41557feae427902bd682e3cd79a1ac97382e3d9'
         '1fc7ea925fdcb38915f191b6a9c85fb46db9ef501dbaa077e8f38876c5e8fda0'
	 '10e470c6099459a072565494c4fd21cc1f4198f1024fe6fdeb6c77ea7e594827'
	 '139c5e4951ea9ab040912ef1f9705de16a37d32fdf7b8c7116eb5a785829c634'
         'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')

package() {
  mkdir -p "${pkgdir}"/usr/share/p4v
  mkdir -p "${pkgdir}"/usr/bin

  cd "${srcdir}"
  cp -R ${pkgname}-${pkgver}/* "${pkgdir}"/usr/share/p4v

  # put a pointer in /usr/bin
  ln -s /usr/share/p4v/bin/{p4v,p4merge,p4admin,p4vc} "${pkgdir}"/usr/bin
  
  # Install icons
  mkdir -p "$pkgdir"/usr/share/icons/hicolor/{16x16,24x24,48x48,96x96}/apps
  install -Dm644 "${pkgname}-${pkgver}"/lib/p4v/P4VResources/icons/P4-Admin_16x16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/p4admin.png
  install -Dm644 "${pkgname}-${pkgver}"/lib/p4v/P4VResources/icons/P4-Admin_24x24.png "$pkgdir"/usr/share/icons/hicolor/24x24/apps/p4admin.png
  install -Dm644 "${pkgname}-${pkgver}"/lib/p4v/P4VResources/icons/P4-Admin_48x48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/p4admin.png
  install -Dm644 "${pkgname}-${pkgver}"/lib/p4v/P4VResources/icons/P4-Admin_96x96.png "$pkgdir"/usr/share/icons/hicolor/96x96/apps/p4admin.png
  install -Dm644 "${pkgname}-${pkgver}"/lib/p4v/P4VResources/icons/P4-Merge_16x16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/p4merge.png
  install -Dm644 "${pkgname}-${pkgver}"/lib/p4v/P4VResources/icons/P4-Merge_24x24.png "$pkgdir"/usr/share/icons/hicolor/24x24/apps/p4merge.png
  install -Dm644 "${pkgname}-${pkgver}"/lib/p4v/P4VResources/icons/P4-Merge_48x48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/p4merge.png
  install -Dm644 "${pkgname}-${pkgver}"/lib/p4v/P4VResources/icons/P4-Merge_96x96.png "$pkgdir"/usr/share/icons/hicolor/96x96/apps/p4merge.png
  install -Dm644 "${pkgname}-${pkgver}"/lib/p4v/P4VResources/icons/P4-V_16x16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/p4v.png
  install -Dm644 "${pkgname}-${pkgver}"/lib/p4v/P4VResources/icons/P4-V_24x24.png "$pkgdir"/usr/share/icons/hicolor/24x24/apps/p4v.png
  install -Dm644 "${pkgname}-${pkgver}"/lib/p4v/P4VResources/icons/P4-V_48x48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/p4v.png
  install -Dm644 "${pkgname}-${pkgver}"/lib/p4v/P4VResources/icons/P4-V_96x96.png "$pkgdir"/usr/share/icons/hicolor/96x96/apps/p4v.png
  
  mkdir -p "${pkgdir}"/usr/share/applications

  # Install desktop files
  install -m644 {p4v,p4merge,p4admin}.desktop "${pkgdir}"/usr/share/applications  
}

# vim:set ts=2 sw=2 et:

# Maintainer: basxto <archlinux basxto de>

pkgname=emulicious-bin
# for release date see WhatsNew.txt
# emulicious does not communicate any version numbers
pkgver=2021.01.30
pkgrel=1
pkgdesc="Game Boy, Game Boy Color, Master System, Game Gear and MSX emulator with C-level debug capabilties"
url="https://emulicious.net"
license=('custom', 'BSD')
arch=('any')
depends=('java-environment')
source=("$pkgname-$pkgver.zip::https://emulicious.net/download/emulicious/?wpdmdl=205" "emulicious.sh" "emulicious.desktop")
sha256sums=('fbe0ac99dae07c19123ecfacca6100a1dc97a9344133a3caa9ab75616892100f' 'SKIP' 'SKIP')

package() {
  # get new release ready
  #grep "^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" ${srcdir}/WhatsNew.txt | head -1 | tr - .
  #sha256sum ${srcdir}/$pkgname-$pkgver.zip
  #makepkg --printsrcinfo > .SRCINFO

  mkdir -p ${pkgdir}/usr/share/$pkgname/ ${pkgdir}/etc/
  install -Dm644 ${srcdir}/License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ${srcdir}/LICENSE-JInput.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-JInput"
  cp -r ${srcdir}/Highlighters/ ${srcdir}/MSX/ ${srcdir}/KeyPresets/ ${pkgdir}/usr/share/$pkgname/
  install -Dm644 ${srcdir}/Emulicious.jar ${srcdir}/WhatsNew.txt ${srcdir}/Expressions.txt ${srcdir}/ReadMe.txt ${srcdir}/*.ports  ${pkgdir}/usr/share/$pkgname/
  install -Dm755 ${srcdir}/emulicious.sh ${pkgdir}/usr/bin/emulicious
  install -Dm644 ${srcdir}/emulicious.desktop ${pkgdir}/usr/share/applications/emulicious.desktop
}

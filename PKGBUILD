# Maintainer: Lloyd Henning <lloyd.w.henning@gmail.com>
# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=ob-xd-bin
pkgver=2.9
_vershort=29
pkgrel=1
pkgdesc="Virtual Analog Synthesizer VST based on the Oberheim OB-X"
arch=(x86_64)
url="https://github.com/reales/OB-Xd"
license=('GPL3')
depends=('alsa-lib' 'freetype2' 'libcurl-gnutls')
provides=('OB-Xd')
source=("https://github.com/reales/OB-Xd/releases/download/v${pkgver}/Obxd${_vershort}Linux.zip")
noextract=("Obxd${_vershort}Linux.zip")
md5sums=("5c928ae406a657750a4025e3c5753750")

prepare() {
install -d "${srcdir}/Obxd${_vershort}Linux"
bsdtar -xvf "Obxd${_vershort}Linux.zip" -C "Obxd${_vershort}Linux"
}

package() {
cd "${srcdir}/Obxd${_vershort}Linux"

install -Dm755 "OB-Xd" "${pkgdir}/usr/bin/OB-Xd"
install -Dm755 "OB-Xd.so" "${pkgdir}/usr/bin/OB-Xd.so"
install -D "OB-Xd Manual.pdf" "${pkgdir}/usr/share/doc/OB-Xd/OB-Xd Manual.pdf"
install -D "MIDI CC.txt" "${pkgdir}/usr/share/doc/OB-Xd/MIDI CC.txt"

install -d "${pkgdir}/usr/lib/vst3/"
install -d "${pkgdir}/usr/lib/lv2/"
install -d "${pkgdir}/$(xdg-user-dir DOCUMENTS)"

cp -r "OB-Xd.vst3" "${pkgdir}/usr/lib/vst3/"
cp -r "OB-Xd.lv2" "${pkgdir}/usr/lib/lv2/"
cp -r "discoDSP" "${pkgdir}/$(xdg-user-dir DOCUMENTS)"
}

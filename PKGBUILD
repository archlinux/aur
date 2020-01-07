#Maintainer: weearc <q19981121@163.com>
pkgname=tencentvideo
_pkgname=$'\u817e\u8baf\u89c6\u9891'
pkgver=1.0.10
pkgrel=1
epoch=
pkgdesc="China's leading online video media platform."
arch=("x86_64")
url="https://v.qq.com"
license=('custom')
groups=()
depends=(
	 'gtk3'
	 'libxcb'
	 'electron'
	)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('tenvideo')
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"https://dldir1.qq.com/qqtv/linux/Tenvideo_universal-$pkgver.$arch.rpm"
	"https://www.qq.com/contract20180827.htm")
noextract=()
sha256sums=('5f26f0cf722dac9dd764abbb860d709de3122f756e8e29e20944b40ac2e17fd1'
            'SKIP')
validpgpkeys=()

prepare() {
	cd ${srcdir}/
	mv opt/$_pkgname opt/tencentvideo
    echo "[Desktop Entry]
Name=tencentvideo
Name[zh_CN]=$_pkgname
Exec=/usr/bin/tencentvideo %U
Terminal=false
Type=Application
Icon=TencentVideo
Comment=
Comment[zh_CN]=不负好时光
Categories=AudioVideo;" > usr/share/applications/TencentVideo.desktop
}


package() {
	install -d ${pkgdir}/opt
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/share/icons
	install -d ${pkgdir}/usr/share/applications
	install -d ${pkgdir}/usr/share/licenses
	
	echo "#!/bin/bash
electron /opt/tencentvideo/app.asar \$@" > ${pkgdir}/usr/bin/tencentvideo && chmod a+x ${pkgdir}/usr/bin/tencentvideo
	
	mkdir ${pkgdir}/opt/tencentvideo
	install -Dm644 ${srcdir}/opt/tencentvideo/resources/app.asar ${pkgdir}/opt/tencentvideo/app.asar
	install -Dm644 ${srcdir}/usr/share/applications/TencentVideo.desktop ${pkgdir}/usr/share/applications/TencentVideo.desktop
	
	mkdir ${pkgdir}/usr/share/licenses/tencent
	install -Dm644 "contract20180827.htm" "${pkgdir}/usr/share/licenses/tencent/contract.htm"
	
	for i in 16 22 24 32 36 48 64 72 96 128 256
	do
        mkdir -p ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps
        install ${srcdir}/usr/share/icons/hicolor/${i}x${i}/apps/TencentVideo.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/TencentVideo.png
    done
}

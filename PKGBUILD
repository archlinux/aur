# Maintainer: Siavash Askari Nasr <ciavash@proton.me>
# Previous Maintainer: Vladimir Svyatski <vsvyatski@yandex.ru>
# Contributor: Dimitris Kiziridis <ragouel@outlook.com>
# Contributor: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: Uncle Hunto <unclehunto@yahoo.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>
# Contributor: Jamesjon <universales@protonmail.com>

pkgname=peazip-qt-bin
pkgver=9.4.0
pkgrel=1
pkgdesc='PeaZip file manager and archiver (Qt5)'
arch=('x86_64')
url='https://peazip.github.io'
license=('LGPL3')
depends=('qt5pas')
options=('!emptydirs')
optdepends=('7-zip: File archiver with a high compression ratio'
			'quad: High-performance file compressor that utilizes an advanced LZ-based compression algorithm'
			'arc: Arc file archiver and compressor'
			'zpaq: Programmable file compressor, library and utilities'
			'paq8o: PAQ8 series of archivers, resurrected by new maintainers'
			'upx: Extendable, high-performance executable packer for several executable formats')
provides=('peazip')
conflicts=('peazip-gtk2-bin' 'peazip-qt5' 'peazip-qt5-bin')
source=("https://github.com/peazip/PeaZip/releases/download/${pkgver}/peazip-${pkgver}.LINUX.Qt5-1.${CARCH}.rpm")
sha256sums=('27b131ab40be1997a7f2c38635eb70814119a51420375237a4a0d681989747bf')

prepare() {
	rm -r usr/share/peazip/batch/{SendTo,'Windows 11 mini context menu','macOS service menus',*.bat}
	rm -r usr/share/peazip/batch/freedesktop_integration/KDE-servicemenus/{KDE3*,KDE4*}
	rm usr/share/peazip/icons/peazip_seven.icl
	rm -r usr/share/peazip/lang-wincontext
	rm usr/share/peazip/readme/readme_{Windows,macOS}.txt
	rm usr/lib/peazip/res/bin/7z/7z.sfx
	chmod -x usr/lib/peazip/res/bin/7z/Codecs/*.so
}

package() {
	local usr_share_peazip='usr/share/peazip'

	install -dm755 "${pkgdir}/usr/"{bin,lib/peazip,share/{doc/peazip,peazip,licenses/peazip/}}

	cp -a usr/bin/peazip "${pkgdir}/usr/bin/"

	cp -ar usr/lib/peazip/{peazip,pea,res} -t "${pkgdir}/usr/lib/peazip/"

	mv "${usr_share_peazip}"/copying/* "${pkgdir}/usr/share/licenses/peazip"

	mv "${usr_share_peazip}/peazip_help.pdf" "${pkgdir}/usr/share/doc/peazip/help.pdf"

	mv "${usr_share_peazip}/readme/readme_Linux.txt" "${pkgdir}/usr/share/doc/peazip/readme.txt"
	rm -r "${usr_share_peazip}/readme/"

	cp -ar "${usr_share_peazip}" -t "${pkgdir}/usr/share"
	cp -ar usr/share/{pixmaps,applications} -t "${pkgdir}/usr/share/"
}

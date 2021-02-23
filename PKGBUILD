# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=ctrecordings-plugin-collection
pkgver=$(date +%Y%m%d)
pkgrel=1
pkgdesc="Cut Through Recordings Plugin Collection."
arch=('x86_64')
url="https://www.cutthroughrecordings.com/downloads"
license=('EULA')
groups=('pro-audio' 'vst-plugins' 'lv2-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

package() {	
	cd $srcdir	
	## Install Plugins VST3 Plugins
	mkdir -p $pkgdir/usr/lib/vst3	
	for vst3 in convergence entropy epicpress faradelay m4compressor popss; do
		if [[ -f `xdg-user-dir DOWNLOAD`/$vst3-LinuxVST3-64Bit.zip ]]; then
			ln -srf `xdg-user-dir DOWNLOAD`/$vst3-LinuxVST3-64Bit.zip $srcdir/$vst3-LinuxVST3-64Bit.zip
			unzip $vst3-LinuxVST3-64Bit.zip		
			cp *.vst3 $pkgdir/usr/lib/vst3
			chmod +x $pkgdir/usr/lib/vst3/*.vst3
		fi
	done
	## Install Plugins VST Plugins
	mkdir -p $pkgdir/usr/lib/vst
	for vst in convergence entropy epicpress faradelay m4compressor popss; do
		if [[ -f `xdg-user-dir DOWNLOAD`/$vst-LinuxVST-64Bit.zip ]]; then		
			ln -srf `xdg-user-dir DOWNLOAD`/$vst-LinuxVST-64Bit.zip $srcdir/$vst-LinuxVST-64Bit.zip		
			unzip $vst-LinuxVST-64Bit.zip
			cp *.so $pkgdir/usr/lib/vst
			chmod +x $pkgdir/usr/lib/vst/*.so
		fi
	done
	## Install Plugins LV2 Plugins
	mkdir -p $pkgdir/usr/lib/lv2
	for lv2 in convergence entropy epicpress faradelay m4compressor popss; do
		if [[ -f `xdg-user-dir DOWNLOAD`/$lv2-LinuxLV2-64Bit.zip ]]; then		
			ln -srf `xdg-user-dir DOWNLOAD`/$lv2-LinuxLV2-64Bit.zip $srcdir/$lv2-LinuxLV2-64Bit.zip
			unzip $lv2-LinuxLV2-64Bit.zip
			if [[ -d $srcdir/ctrecordings-$lv2.LV2 ]]; then			
				cp -r $srcdir/ctrecordings-$lv2.LV2 $pkgdir/usr/lib/lv2/ctrecordings-$lv2.lv2
			fi			
			if [[ -d $srcdir/POPSoundShaper.lv2 ]]; then
				cp -r $srcdir/POPSoundShaper.lv2 $pkgdir/usr/lib/lv2/POPSoundShaper.lv2
			fi
		fi
	done
}

# Maintainer: Ali Najafian <AliNajafian81@gmail.com>
pkgname=circuitjs-bin
pkgver=2.7.1
pkgrel=1
pkgdesc="Falstad Circuit Simulator for Linux. (Real and offline version)"
arch=(x86_64)
url="https://www.falstad.com/circuit/"
license=('GPL')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(circuitjs-bin)
conflicts=(circuitjs-bin)
options=(!strip)

source=("https://www.falstad.com/circuit/offline/circuitjs1-linux64.tgz"
		  	https://i.postimg.cc/Y0ZkBmDV/circuitjs.png	  
		  	circuitjs.desktop)
sha256sums=('SKIP' 'b3ed46fb30478e7207a557658226be18ae1edacd1ee784cb2089e6eaa9a13716' 'e9cb7b4b74ff97f4a5da500bb7217d2796bbe21f2ed62508b391275adb1e3a14')


package() 
{
	cd $srcdir/circuitjs1
	echo packaging ${pkgname}
	install -d $pkgdir/opt/circuitjs/
	install -d ${pkgdir}/usr/bin
	cp -R "${srcdir}/circuitjs1/." "${pkgdir}/opt/circuitjs/"
	
	# create symlink from real opt to bin
	ln -s /opt/circuitjs/circuitjs1 "${pkgdir}"/usr/bin/circuitjs
	
	#integrate the desktop file
	install -d ${pkgdir}/usr/share/applications/
	install -m644 ${srcdir}/circuitjs.desktop ${pkgdir}/usr/share/applications/circuitjs.desktop
	
	#integrate icons...
   for res in 32 48 64 128 192 256 512; do
   	install -d $pkgdir/usr/share/icons/hicolor/${res}x${res}/apps
   	install -m644 ${srcdir}/circuitjs.png $pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/circuitjs.png
   done
   
	echo done!
}

# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=fuhquake
pkgver=0.31                                  
pkgrel=4
pkgdesc="A QuakeWorld Client for Win32/Linux. You need the retail pak files to play."
url="http://www.fuhquake.net/"
license="GPL"
depends=('libgl')
makedepends=('unzip')
conflicts=('ezquake')
provides=()
install=fuhquake.install
source=('fuhquake.launcher' 'fuhquake.install' 'fuhquake.desktop' 'fuhquake.ico' \
"http://www.slashbunny.com/quake/$pkgname-linux-v$pkgver.zip")
md5sums=('c471e673a64882e3653fd953b1a3da1f' '8ea170b09fe50223bb66bf93a3f160b0'\
         'e64a0918e48595f4a8fb47d0e39b8c84' '6a0f7982f82886210448490be5762ab0'\
         'd4476cc49db638e5304ddd6cd744b62a')

build() {
	cd $startdir/src

	# Unpack fuhQuake
	unzip $pkgname-linux-v$pkgver.zip -d quake/

	# Make binaries executable
	chmod +x quake/fuhquake-gl.glx
	chmod +x quake/fuhquake.svga
	chmod +x quake/fuhquake.x11

	# Move data to package directory
	install -d $startdir/pkg/opt/
	mv quake/ $startdir/pkg/opt/

	# Make id1 Directory for pak0.pak and pak1.pak files
	install -d $startdir/pkg/opt/quake/id1/

	# Install Launcher
	install -D -m755 $startdir/src/fuhquake.launcher \
		$startdir/pkg/usr/bin/fuhquake

	# Install Desktop
	install -D -m644 $startdir/src/fuhquake.desktop \
		$startdir/pkg/usr/share/applications/fuhquake.desktop

	# Install Icon
	install -D -m644 $startdir/src/fuhquake.ico \
		$startdir/pkg/usr/share/pixmaps/fuhquake.ico

	# Make Configs directory with permissions root:games so users can save configs
	install -d -m 775 -o root -g games $startdir/pkg/opt/quake/fuhquake/configs/
} 

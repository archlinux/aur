# Maintainer: rern <rernrern@gmail.com>

pkgname=bluealsa
pkgver=3.1.0
pkgrel=1
pkgdesc='Bluetooth audio ALSA backend'
arch=( x86_64
       aarch64
       armv6h
       armv7h )
reponame=bluez-alsa
url=https://github.com/Arkq/$reponame
license=( MIT )
depends=( alsa-lib bluez-libs glib2 libfdk-aac sbc systemd )
makedepends=( git python-docutils )
optdepends=( 'lame: build with mp3 support'
             'libbsd: build with hcitop tool'
             'libopenaptx-git: build with libopenaptx for apt-X'
             'mpg123: build with mpg123 decoding support'
             'ncurses: build with hcitop tool'
             'readline: build with bluealsa-rfcomm tool'
             'spandsp: build mSBC codec support' )
source=( git+https://github.com/Arkq/$reponame )
sha512sums=( SKIP )

build() {
	local flags

	cd $reponame
	autoreconf --install
	flags=( #--with-libopenaptx
		  #--enable-a2dpconf
		  --enable-aac
		  --enable-cli
		  --enable-debug
		  #--enable-hcitop
		  #--enable-ldac
		  --enable-manpages
		  #--enable-mp3lame
		  #--enable-mpg123
		  #--enable-msbc
		  --enable-ofono
		  #--enable-rfcomm
		  --enable-systemd
		  --enable-upower )
	./configure --prefix=/usr --sysconfdir=/etc "${flags[@]}"
	make
}

package() {
	cd $reponame
	make DESTDIR=$pkgdir install
	install -Dm0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

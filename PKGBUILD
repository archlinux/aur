# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('jellyfin-rpc-bin')
pkgver=0.15.1
pkgrel=1
pkgdesc="Displays the content you're currently watching on Discord"
arch=('x86_64')
url="https://github.com/Radiicall/jellyfin-rpc"
license=('GPL3')
depends=('glibc' 'gcc-libs')
provides=('jellyfin-rpc')
conflicts=('jellyfin-rpc')
source=("https://github.com/Radiicall/jellyfin-rpc/releases/download/$pkgver/jellyfin-rpc-x86_64-linux"
		"git+https://github.com/Radiicall/jellyfin-rpc")
md5sums=('SKIP' 'SKIP')

prepare() {
	cd $srcdir
	sed -i "s|^ExecStart=.*\$|ExecStart=/usr/lib/jellyfin-rpc/jellyfin-rpc|" jellyfin-rpc/scripts/jellyfin-rpc.service
}


package() {
	cd $srcdir
	install -Dm0755 ./jellyfin-rpc-x86_64-linux "$pkgdir/usr/lib/jellyfin-rpc/jellyfin-rpc"
	install -Dm0644 ./jellyfin-rpc/example.json  "$pkgdir/usr/lib/jellyfin-rpc/example.json"
	install -Dm0644 ./jellyfin-rpc/scripts/jellyfin-rpc.service "$pkgdir/usr/lib/systemd/user/jellyfin-rpc.service"

	echo
	echo
	echo -------------------------------------------------------------
	echo 'READ THE GITHUB DOCUMENTATION - CONFIG FILE MUST BE EDITED BEFORE USE'
	echo 'jellyfin-rpc binary is located at /usr/lib/jellyfin-rpc/jellyfin-rpc'
	echo 'systemd service file is located at /usr/lib/systemd/user/jellyfin-rpc.service'
	echo 'example config is located at /usr/lib/jellyfin-rpc/example.json'
	echo
	if [ -d $XDG_CONFIG_HOME ]; then
		echo "Place your main.json at $XDG_CONFIG_HOME/jellyfin-rpc/main.json"
	else
		echo "Place your main.json at /home/$USER/.config/jellyfin-rpc/main.json"
	fi
	echo -------------------------------------------------------------
	echo
	echo
}

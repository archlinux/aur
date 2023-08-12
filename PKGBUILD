# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('jellyfin-rpc-bin')
pkgver=0.14.1
pkgrel=1
pkgdesc="Displays the content you're currently watching on Discord"
arch=('x86_64')
url="https://github.com/Radiicall/jellyfin-rpc"
license=('GPL3')
depends=('glibc' 'gcc-libs')
provides=('jellyfin-rpc-bin')
conflicts=('jellyfin-rpc' 'jellyfin-rpc-git')
source=("https://github.com/Radiicall/jellyfin-rpc/releases/download/$pkgver/jellyfin-rpc-x86_64-linux"
		"git+https://github.com/0xGingi/jellyfin-rpc-aur")
md5sums=('SKIP' 'SKIP')

package() {
	cd $srcdir
	install -Dm0755 ./jellyfin-rpc-x86_64-linux "$pkgdir/usr/lib/jellyfin-rpc/jellyfin-rpc"
	install -Dm0644 ./jellyfin-rpc-aur/example.json  "$pkgdir/usr/lib/jellyfin-rpc/example.json"
	install -Dm0644 ./jellyfin-rpc-aur/jellyfin-rpc.service "$pkgdir/usr/lib/systemd/user/jellyfin-rpc.service"

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

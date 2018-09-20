# Maintainer: Caleb Woodbine <gitlab.com/BobyMCbobs>
pkgname=getnewip
pkgver=2.2.1
pkgrel=1
pkgdesc="Sync dynamic public IP addresses of GNU/Linux servers with the hostname in a user's SSH config file, via Dropbox."
arch=('any')
url="https://gitlab.com/BobyMCbobs/${pkgname}"
license=('GPL')
depends=('gnu-netcat' 'curl' 'bash' 'openssh' 'nano' 'iputils')
source=("https://gitlab.com/BobyMCbobs/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('c9cabadd60c799c4f2211640f95946e9')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

pre_remove() {
	systemctl disable getnewip
	systemctl stop getnewip
}

post_remove() {
	rm -rf /etc/getnewip

}

# Maintainer: Caleb Woodbine <gitlab.com/BobyMCbobs>
pkgname=uploadnewip
pkgver=2.2.1
pkgrel=1
pkgdesc="Upload new dynamic public IP address of a GNU/Linux server to Dropbox every time it changes."
arch=('any')
url="https://gitlab.com/BobyMCbobs/${pkgname}"
license=('GPL')
depends=('curl' 'bash' 'nano' 'iputils')
source=("https://gitlab.com/BobyMCbobs/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('f00265468b323a417ca3766c07f9ff3b')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

pre_remove() {
	systemctl disable uploadnewip
	systemctl stop uploadnewip
}

post_remove() {
	rm -rf /etc/uploadnewip
	rm -rf /var/cache/uploadnewip

}

# Maintainer: Joshua Deakin contact[at]joshuadeakin[dot]com

# Note: You may want to add /opt/Katana<version>/ to $PATH
# Note: May need to stop Qt from using the MIT-SHM X11 Shared Memory Extension:
# $ env QT_X11_NO_MITSHM=1 /opt/Katana<version>/katana
# Note: Uncomment the ACCEPTEULA line to auto accept EULA agreement.

pkgname='katana'
pkgbase='katana'
pkgver='3.0v1'
pkgrel=1
pkgdesc="VFX package for asset based look development and lighting"
arch=('x86_64')
url="https://www.foundry.com"
license=('custom')
depends=()
makedepends=()
options=('!strip')

prepare() {
	wget -O "katana${pkgver}.tar.gz" "https://www.foundry.com/products/download_product?file=Katana${pkgver}-linux-x86-release-64.tgz"
	tar -xvzf "katana${pkgver}.tar.gz"
	sed -i 's/more EULA/cat EULA/' "${srcdir}/install.sh"
}

package() {
	dest_katana="${pkgdir}/opt/${pkgname}${pkgver}"
	dest_3delight="${pkgdir}/opt/${pkgname}${pkgver}-3delight"
	echo "${dest_katana}"
	echo "${dest_3delight}"
	#export ACCEPTEULA='yes'
	export KATANAPATH="${dest_katana}"
	export DELIGHTPATH="${dest_3delight}"
	bash install.sh
}


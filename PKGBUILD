# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>
# Base Package Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=bbswitch-think
_pkgname=bbswitch
_kernel=4.5
pkgver=0.8
_extramodules=extramodules-$_kernel-think # Don't forget to update bbswitch.install
pkgrel=13
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('i686' 'x86_64')
#url=('http://github.com/Bumblebee-Project/bbswitch')
license=('GPL')
depends=("linux-think>=$_kernel")
provides=('bbswitch-think')
conflicts=('bbswitch-dkms' 'bbswitch-git-dkms')
makedepends=("linux-think-headers")
install=bbswitch.install
source=("https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz")
md5sums=('5b116b31ace3604ddf9d1fc1f4bc5807')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

	make KDIR=/lib/modules/${_kernver}/build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
		   
	install -Dm644 bbswitch.ko "${pkgdir}"/usr/lib/modules/${_extramodules}/bbswitch.ko
	gzip "${pkgdir}/usr/lib/modules/${_extramodules}/bbswitch.ko"                      
}


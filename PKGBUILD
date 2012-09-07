# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl
pkgver=0.2.3
pkgrel=2
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains"
arch=('i686' 'x86_64')
url="http://www.orocos.org/kdl"
license=('GPL')
depends=('eigen3')
makedepends=('cmake')

build() {
	# the archive contains a timestamp that is updated for each download
	# this makes the md5sum invalid, so we download the archive manually
	if [ ! -f "${pkgname}-${pkgver}.tgz" ]
	then
		wget "http://git.mech.kuleuven.be/?p=robotics/orocos_kinematics_dynamics.git;a=snapshot;h=ffdeaadc5a2af179a83dd50e4dc221a15aeccccc;sf=tgz" -O${pkgname}-${pkgver}.tgz
	fi
	tar zxf ${pkgname}-${pkgver}.tgz -C "${srcdir}"
	
	cd ${srcdir}/orocos_kinematics_dynamics-ffdeaad/orocos_kdl
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd ${srcdir}/orocos_kinematics_dynamics-ffdeaad/orocos_kdl
	
	make DESTDIR=${pkgdir} install
}


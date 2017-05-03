# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=openhab2
pkgver=2.0.0
pkgrel=1
pkgdesc="openHAB2 open source home automation software"
arch=('any')
url="http://www.openhab.org/"
license=('EPL')
depends=('java-runtime-headless>=8')

conflicts=('openhab-runtime' 'openhab-addons')

backup=('etc/openhab2/conf/services/addons.cfg'
		'etc/openhab2/conf/services/runtime.cfg')

source=("openhab-${pkgver}.tar.gz::https://bintray.com/openhab/mvn/download_file?file_path=org%2Fopenhab%2Fdistro%2Fopenhab%2F${pkgver}%2Fopenhab-${pkgver}.tar.gz"
        "openhab2.service")

noextract=("openhab-${pkgver}.tar.gz")

sha256sums=('b40ba9bae69326cbb36af87e7f335bb90af02b11bce638a7c3838aed64f3ce8b'
  	'a115b9883b3e46c8d29d1a9e47aa1bdf4688de96290794d654783a7d7e34f538')

prepare() {
	mkdir ${srcdir}/openhab2
	cd ${srcdir}/openhab2
	tar xzf ${srcdir}/openhab-${pkgver}.tar.gz
}

package() {
	cd ${pkgdir}

	mkdir -p etc/openhab2
	mkdir -p opt
	mkdir -p usr/lib/systemd/system

	cp ${srcdir}/openhab2.service usr/lib/systemd/system

	cp -r ${srcdir}/openhab2 opt

	mv opt/openhab2/conf etc/openhab2/conf
	ln -s /etc/openhab2/conf opt/openhab2/conf
}

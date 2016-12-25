# Maintainer: Daniel Hillenbrand <codeworkx@bbqlinux.org>
pkgname=openhab-beta
_pkgver=2.0.0.b5
pkgver=2.0.0.b5
pkgrel=2
pkgdesc="openHAB2 open source home automation software"
arch=('any')
url="http://www.openhab.org/"
license=('EPL')
depends=('java-runtime-headless>=8')
makedepends=('unzip')

conflicts=('openhab-runtime' 'openhab-addons')

backup=('etc/openhab/conf/services/addons.cfg'
		'etc/openhab/conf/services/runtime.cfg')

source=("https://bintray.com/openhab/mvn/download_file?file_path=org%2Fopenhab%2Fdistro%2Fopenhab-offline%2F${_pkgver}%2Fopenhab-offline-${_pkgver}.tar.gz"
        "openhab.service")

sha256sums=('8eadd4f815c608771a6b74ad5d49eae1ec4e18ef8dd5d32c130ba4d8f0766187'
            '92be5e206c878bb1a1b476f62b815f24dca198e8e0055095f797d264d8521bfe')

package() {
	cd $pkgdir

    mkdir -p etc/openhab
	mkdir -p opt/openhab
	mkdir -p usr/lib/systemd/system

    # copy system service file
	cp $srcdir/openhab.service usr/lib/systemd/system
    
    # copy main openhab files
	cp -r $srcdir/runtime opt/openhab/
	cp -r $srcdir/userdata opt/openhab/
	cp -r $srcdir/LICENSE.TXT opt/openhab/
	cp -r $srcdir/start.bat opt/openhab/
	cp -r $srcdir/start.sh opt/openhab/
	cp -r $srcdir/start_debug.bat opt/openhab/
	cp -r $srcdir/start_debug.sh opt/openhab/

    # copy addons and conf
    cp -r $srcdir/addons etc/openhab/addons
	cp -r $srcdir/conf etc/openhab/conf

    # create symlinks
	ln -s /etc/openhab/conf opt/openhab/conf
	ln -s /etc/openhab/addons opt/openhab/addons
}

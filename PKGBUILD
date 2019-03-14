# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=ava-plugins
pkgver=2.1.0
pkgrel=1
pkgdesc="Harrison Consoles VST Plugin Suite."
arch=('x86_64')
url="https://www.harrisonconsoles.com/site/ava-plugins.html"
license=('EULA')
depends=('glibc' 'xorg-server')
provides=("$pkgname")
conflicts=("$pkgname")

prepare () {
	_archive=Harrison-AVA-linux-64bit.tar.gz
	if [ -f ../Harrison-AVA-linux-64bit.tar.gz ]; then
		ln -srf ../${_archive} $srcdir/Harrison-AVA-linux-64bit.tar.gz
		tar -xvzf Harrison-AVA-linux-64bit.tar.gz
	else
		echo "Please download a copy from https://harrisonconsoles.com/site/ava-plugins.html. Then put the Harrison-AVA-linux-64bit.tar.gz in the root of this PKGBUILD directory."
	fi
}

package() {
	## Install Plugins
	for plugin in DS LegacyQ MC ME; do
		if [ -f $srcdir/Harrison_AVA/vst/AVA-$plugin.so ]; then
			install -D "$srcdir/Harrison_AVA/vst/AVA-$plugin.so" "$pkgdir/usr/lib/vst/AVA-$plugin.so"
		fi
	done
	## Install Serial Keys
	for license in ds legacyq mc me; do
		if [ -f ../license_key_harrison_ava_${license}.txt ]; then
			install -D ../license_key_harrison_ava_$license.txt $pkgdir/usr/local/share/license_key_harrison_ava_$license.txt
		fi
	done
	## Install Software License
	install -D "$srcdir/Harrison_AVA/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
}

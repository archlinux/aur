pkgname=ava-plugins
pkgver=$(date +%Y%m%d)
pkgrel=1
pkgdesc="Harrison Consoles VST AVA Plugin Suite"
arch=('x86_64')
url="https://www.harrisonconsoles.com/site/ava-plugins.html"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract AVA Plugins Archive
	_archive="`xdg-user-dir DOWNLOAD`/Harrison-AVA-linux-64bit.tar.gz"
	ln -srf ${_archive} "$srcdir/`basename ${_archive}`"
	tar -xvzf "$srcdir/`basename ${_archive}`"
}

package() {
	## Install Plugins
	for plugin in BF DS LegacyQ MC ME SC DF VF; do
		if [ -f $srcdir/Harrison_AVA/vst/AVA-$plugin.so ]; then
			install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-$plugin.so" "$pkgdir/usr/lib/vst/AVA-$plugin.so"
		fi
	done

	## Install EULA
	install -Dm644 "$srcdir/Harrison_AVA/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
}

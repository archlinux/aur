pkgname=sofia-woodwinds
pkgver=1.1.1
pkgrel=1
pkgdesc="Sofia Woodwinds Sample Library (VST Plugin)."
arch=('x86_64')
url="https://librewave.com/product/sofia-woodwinds/"
license=('GPL3')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract Sofia Woodwinds
	_runscript="Sofia Woodwinds 1.1.1.sh"
	ln -srf "`xdg-user-dir DOWNLOAD`/${_runscript}" "$srcdir/${_runscript}"
	chmod +x "$srcdir/`basename "${_runscript}"`"
	sh "$srcdir/`basename "${_runscript}"`" --tar xvf
}

package() {
    ## Install VST Plugin
    install -Dm755 "$srcdir/Sofia Woodwinds.so" "$pkgdir/usr/lib/vst/Sofia Woodwinds.so"

    ## Install EULA
    install -Dm644 "$srcdir/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

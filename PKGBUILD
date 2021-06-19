pkgname=omalleys-irish-whistles
pkgver=1.0.0
pkgrel=1
pkgdesc="Omalleys Irish Whistles Sample Library (VST Plugin)."
arch=('x86_64')
url="https://librewave.com/product/omalleys-irish-whistles/"
license=('GPL3')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract Michaelas Harp
	_runscript="`xdg-user-dir DOWNLOAD`/OMalleys Irish Whistles 1.0.0.sh"
	ln -srf "${_runscript}" "$srcdir/`basename "${_runscript}"`"
	chmod +x "$srcdir/`basename "${_runscript}"`"
	sh "$srcdir/`basename "${_runscript}"`" --tar xvf
}

package() {
    ## Install VST Plugin
    install -Dm755 "$srcdir/OMalleys Irish Whistles.so" "$pkgdir/usr/lib/vst/OMalleys Irish Whistles.so"

    ## Install EULA
    install -Dm644 "$srcdir/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgname=kazbek
pkgver=1.0.1
pkgrel=1
pkgdesc="Kazbek Sample Library (VST Plugin)"
arch=('x86_64')
url="https://librewave.com/product/kazbek/"
license=('GPL3')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract Michaelas Harp
	_runscript="`xdg-user-dir DOWNLOAD`/Kazbek 1.0.1.sh"
	ln -srf "${_runscript}" "$srcdir/`basename "${_runscript}"`"
	chmod +x "$srcdir/`basename "${_runscript}"`"
	sh "$srcdir/`basename "${_runscript}"`" --tar xvf
}

package() {
    ## Install VST Plugin
    install -Dm755 "$srcdir/Kazbek.so" "$pkgdir/usr/lib/vst/Kazbek.so"

    ## Install EULA
    install -Dm644 "$srcdir/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

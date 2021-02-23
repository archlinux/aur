# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=omalleys-irish-whistles
pkgver=1.0.0
pkgrel=2
pkgdesc="Omalleys Irish Whistles Sample Library (VST Plugin)."
arch=('x86_64')
url="https://librewave.com/product/omalleys-irish-whistles/"
license=('GPL3')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
source=("OMalleys Irish Whistles.desktop")
md5sums=('748d7a85b4069cc877452efc035ba2af')

prepare () {
	## Extract Michaelas Harp
	_runscript="`xdg-user-dir DOWNLOAD`/OMalleys Irish Whistles 1.0.0.sh"
	ln -srf "${_runscript}" "$srcdir/`basename "${_runscript}"`"
	chmod +x "$srcdir/`basename "${_runscript}"`"
	sh "$srcdir/`basename "${_runscript}"`" --tar xvf
}

package() {
    ## Install Standalone Application
    install -Dm755 "$srcdir/OMalleys Irish Whistles" "$pkgdir/usr/bin/OMalleys Irish Whistles"

    ## Install Desktop Launcher
    install -Dm644 "$srcdir/OMalleys Irish Whistles.desktop" "$pkgdir/usr/share/applications/OMalleys Irish Whistles.desktop"

    ## Install VST Plugin
    install -Dm755 "$srcdir/OMalleys Irish Whistles.so" "$pkgdir/usr/lib/vst/OMalleys Irish Whistles.so"

    ## Install EULA
    install -Dm644 "$srcdir/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

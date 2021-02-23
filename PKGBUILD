# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=sofia-woodwinds
pkgver=1.1.1
pkgrel=2
pkgdesc="Sofia Woodwinds Sample Library (VST Plugin)."
arch=('x86_64')
url="https://librewave.com/product/sofia-woodwinds/"
license=('GPL3')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
source=("Sofia Woodwinds.desktop")
md5sums=('89546c3c831661ee481253be9204f415')

prepare () {
	## Extract Sofia Woodwinds
	_runscript="Sofia Woodwinds 1.1.1.sh"
	ln -srf "`xdg-user-dir DOWNLOAD`/${_runscript}" "$srcdir/${_runscript}"
	chmod +x "$srcdir/`basename "${_runscript}"`"
	sh "$srcdir/`basename "${_runscript}"`" --tar xvf
}

package() {
    ## Install Standalone Application
    install -Dm755 "$srcdir/Sofia Woodwinds" "$pkgdir/usr/bin/Sofia Woodwinds"

    ## Install Desktop Launcher
    install -Dm644 "$srcdir/Sofia Woodwinds.desktop" "$pkgdir/usr/share/applications/Sofia Woodwinds.desktop"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Sofia Woodwinds.so" "$pkgdir/usr/lib/vst/Sofia Woodwinds.so"

    ## Install EULA
    install -Dm644 "$srcdir/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

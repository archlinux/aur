# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=kazbek
pkgver=1.0.1
pkgrel=2
pkgdesc="Kazbek Sample Library (VST Plugin)."
arch=('x86_64')
url="https://librewave.com/product/kazbek/"
license=('GPL3')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
source=("Kazbek.desktop")
md5sums=('3983051b7c8e780a3511eda87148b767')

prepare () {
	## Extract Michaelas Harp
	_runscript="`xdg-user-dir DOWNLOAD`/Kazbek 1.0.1.sh"
	ln -srf "${_runscript}" "$srcdir/`basename "${_runscript}"`"
	chmod +x "$srcdir/`basename "${_runscript}"`"
	sh "$srcdir/`basename "${_runscript}"`" --tar xvf
}

package() {
    ## Install Standalone Application
    install -Dm755 "$srcdir/Kazbek" "$pkgdir/usr/bin/Kazbek"

    ## Install Desktop Launcher
    install -Dm644 "$srcdir/Kazbek.desktop" "$pkgdir/usr/share/applications/Kazbek.desktop"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Kazbek.so" "$pkgdir/usr/lib/vst/Kazbek.so"

    ## Install EULA
    install -Dm644 "$srcdir/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

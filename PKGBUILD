# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=michaelas-harp
pkgver=1.0.0
pkgrel=2
pkgdesc="Michaelas Harp Sample Library (VST Plugin)."
arch=('x86_64')
url="https://librewave.com/product/michaelas-harp/"
license=('GPL3')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
source=("Michaelas Harp.desktop")
md5sums=('1fc5f8dc486ab5f7779d4b6b71b6b064')

prepare () {
	## Extract Michaelas Harp
	_runscript="`xdg-user-dir DOWNLOAD`/Michaelas Harp 1.0.0.sh"
	ln -srf "${_runscript}" "$srcdir/`basename "${_runscript}"`"
	chmod +x "$srcdir/`basename "${_runscript}"`"
	sh "$srcdir/`basename "${_runscript}"`" --tar xvf
}

package() {
    ## Install Standalone Application
    install -Dm755 "$srcdir/Michaelas Harp" "$pkgdir/usr/bin/Michaelas Harp"

    ## Install Desktop Launcher
    install -Dm644 "$srcdir/Michaelas Harp.desktop" "$pkgdir/usr/share/applications/Michaelas Harp.desktop"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Michaelas Harp.so" "$pkgdir/usr/lib/vst/Michaelas Harp.so"

     ## Install EULA
    install -Dm644 "$srcdir/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

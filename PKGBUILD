# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Josh Miller <josh@joshdmiller.com>
# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=celtx-bin
pkgver=2.9.7
pkgrel=1
pkgdesc="Combines full-feature scriptwriting with pre-production support and online collaboration. Precompiled binary version."
arch=('i686' 'x86_64')
url="http://celtx.com"
license=('CePL')
options=('!strip')
conflicts=('celtx')
depends=('libpng12')

if [ "$CARCH" = "i686" ]; then
	source=("http://download.celtx.com/${pkgver}/Celtx-${pkgver}.tar.bz2" 'CePL-1.3.txt' 'celtx.desktop')
	sha256sums=('c93a56f2ba2afab3ac43fff7e162f03b4bee54da0df7f01af090eba028577233'
    '92a58490d79d76d77bb461c59be6bdb14d429025e56c58a442b564c3021bd951'
    'd0cd298b0db937fe1426e60496c932bf454b515a53c9596712241e42fc18fdee')
elif [ "$CARCH" = "x86_64" ]; then
	source=("http://download.celtx.com/${pkgver}/Celtx-${pkgver}-64.tar.bz2" 'CePL-1.3.txt' 'celtx.desktop')
sha256sums=('7045d0ef44d84e3692b9b2cfc9c8c62317d4bbc34da2b180c5684495250b1aab'
            '92a58490d79d76d77bb461c59be6bdb14d429025e56c58a442b564c3021bd951'
            'd0cd298b0db937fe1426e60496c932bf454b515a53c9596712241e42fc18fdee')

fi

package() {
	mkdir -p "${pkgdir}/opt/celtx" "${pkgdir}/usr/bin"
	mv "${srcdir}/celtx" "${pkgdir}/opt"
	ln -s "${pkgdir}/opt/celtx ${pkgdir}/usr/bin/celtx" # in case users run it from a shell
	install -D -m644 "${srcdir}/CePL-1.3.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
	install -D -m644 "${srcdir}/celtx.desktop" "${pkgdir}/usr/share/applications/celtx.desktop"
}
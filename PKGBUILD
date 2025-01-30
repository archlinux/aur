# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=nodejs-inshellisense
_pkgname=@microsoft/inshellisense
pkgver=0.0.1_rc.20
pkgrel=1
pkgdesc="IDE style command line auto complete"
arch=(any)
url="https://github.com/microsoft/inshellisense"
license=('MIT')
depends=(nodejs-lts-jod glibc gcc-libs bash)
makedepends=(npm)
source=(https://registry.npmjs.org/$_pkgname/-/inshellisense-${pkgver//_/-}.tgz)
noextract=(inshellisense-${pkgver//_/-}.tgz)
sha256sums=('9ba721c7df90a83dd192cbbfdcba0d2e0b9ef798775de1eeb860927135cd7b5e')
options=(!emptydirs)

package() {
	npm install --omit=dev -g --prefix "${pkgdir}/usr" "${srcdir}/inshellisense-${pkgver//_/-}.tgz"
	install -vDm644 $pkgdir/usr/lib/node_modules/@microsoft/inshellisense/LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
	rm -r $pkgdir/usr/lib/node_modules/@microsoft/inshellisense/node_modules/typescript
	rm -r $pkgdir/usr/lib/node_modules/@microsoft/inshellisense/node_modules/.bin
	find $pkgdir \( -name "*.py" -or -name "*.ts" \) -delete
	# fix https://github.com/xtermjs/xterm.js/issues/2749
	find $pkgdir -name "xterm-headless.js" -print -exec sed -i 's/in window?/in this?/' {} \;
}

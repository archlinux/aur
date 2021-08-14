# Maintainer: eNV25 <env252525@gmail.com>

pkgname=gccgo-bin
pkgver=11.1.0
pkgrel=1
_pkgrel_=1
pkgdesc=' gccgo  compiler for the  go  command. For use with  go build -compiler gccgo .'
arch=(x86_64)
url='https://gcc.gnu.org'
license=(GPL LGPL FDL custom)
depends=("gcc=${pkgver}-${_pkgrel_}")
provides=('gccgo')
conflicts=('gcc-go')
options=(!strip)
source=("gcc-go-${pkgver}-${_pkgrel_}-x86_64.tar.zst::https://github.com/eNV25/aur-gccgo-bin/releases/download/${pkgver}-${_pkgrel_}/gcc-go-${pkgver}-${_pkgrel_}-x86_64.pkg.tar.zst")
sha256sums=('8bc1dc82ca3220bec383a2a4bdf6fe1cb9a34a3cb2c9e01700ce5709da754343')

package() {
	install -dm755 "$pkgdir/usr/"
	install -dm755 "$pkgdir/usr/bin/"

	# omit  go  and  gofmt  commands to avoid conflict with go package
	cp --no-dereference --preserve=mode,ownership,links ./usr/bin/gccgo "$pkgdir/usr/bin/"
	cp --no-dereference --preserve=mode,ownership,links ./usr/bin/x86_64-pc-linux-gnu-gccgo "$pkgdir/usr/bin/"

	# copy rest
	cp --recursive --no-dereference --preserve=mode,ownership,links ./usr/lib/ "$pkgdir/usr/"
	cp --recursive --no-dereference --preserve=mode,ownership,links ./usr/lib32/ "$pkgdir/usr/"
	cp --recursive --no-dereference --preserve=mode,ownership,links ./usr/share/ "$pkgdir/usr/"
}

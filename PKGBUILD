pkgname=ponscripter
pkgver=v3.0.1
_pkgver=`curl -s https://api.github.com/repos/07th-mod/ponscripter-fork/releases/latest|grep tag_name|cut -d\" -f4`
pkgrel=1
pkgdesc="Fork of the Ponscripter visual novel engine to take advantage of SDL2 and improve Steam integration"
arch=(x86_64 aarch64)
url=https://github.com/07th-mod/ponscripter-fork
license=(GPL2)
depends=(sdl2_{image,mixer} smpeg2 freetype2)
source=(git+https://github.com/07th-mod/ponscripter-fork.git#tag=$_pkgver)
md5sums=(SKIP)
pkgver(){
	echo $_pkgver
}
build(){
	cd $pkgname-fork
	./configure --with-external-sdl-mixer
	make
}
package(){
	cd $pkgname-fork
	install src/ponscr -Dt "$pkgdir"/usr/bin
	install BUGS CHANGES MANUAL README.md TODO -Dt "$pkgdir"/usr/share/doc/$pkgname
}

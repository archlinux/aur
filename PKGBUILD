# Mantainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

_appname=cocos2d-x
pkgname=cocos2d-x-src
pkgver=3.9
pkgrel=1
pkgdesc="Cocos2D-X is a game engine that supports multiple platforms such as iOS, Android, WinXP/7/8, WP8, BlackBerry, MeeGo, Marmelade, WebOS, Mac OS X"
arch=('i686' 'x86_64')
url="http://www.cocos2d-x.org/filedown/"
license=('MIT License')
depends=('glew' 'glfw' 'glibc' 'fontconfig' 'libgl' 'curl' 'libx11' 'zlib' 'libpng' 'freetype2' 'python2')
#depends=('openssl' 'sqlite3')
options=('!buildflags' '!strip' 'staticlibs')
source=("${url}${_appname}-${pkgver}.zip"
	"README"
	"$_appname.sh"
	"$_appname.csh"
)
sha1sums=('54ef0c205702f49f61bac119e08ad5bb39434ee9'
	'1f9b4f74223b5ac1ec235c553e9eca2a2c927eca'
	'353bdefe07bdb6eb7f53aff20d20e83b488c1c05'
	'49b7919fc38803c1dd2f5b1d47fb0c75fde1fec6'
)

prepare() {
	chmod +x "download-deps.py"
	python2 "download-deps.py" -r yes
}

package() {
	install -d   "$pkgdir/opt/$_appname"
	install -Dm644 "README" "$pkgdir/opt/$_appname/README"
	install -Dm755 "$_appname.sh" "$pkgdir/etc/profile.d/$_appname.sh"
	install -Dm755 "$_appname.csh" "$pkgdir/etc/profile.d/$_appname.csh"
	rm "README" "$_appname.sh" "$_appname.csh" "${_appname}-${pkgver}.zip"
	mv "$srcdir/"*  "$pkgdir/opt/$_appname" 	
}

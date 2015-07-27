# Mantainer: samuel.forgione@gmail.com

_appname=cocos2d-x
pkgname=cocos2d-x-src
pkgver=3.7
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
sha1sums=('d493f8738a584812f60ab21a84cd069a1ca208d1'
	'1f9b4f74223b5ac1ec235c553e9eca2a2c927eca'
	'353bdefe07bdb6eb7f53aff20d20e83b488c1c05'
	'49b7919fc38803c1dd2f5b1d47fb0c75fde1fec6'
)

prepare() {
	chmod +x "${_appname}-${pkgver}/download-deps.py"
	python2 "${_appname}-${pkgver}/download-deps.py" -r yes
}

package() {
	install -d 			"$pkgdir/opt/"
	mv "$_appname-$pkgver" 		"$pkgdir/opt/$_appname"
	install -Dm644 "README" 	"$pkgdir/opt/$_appname/"
	install -Dm755 "$_appname.sh" 	"$pkgdir/etc/profile.d/$_appname.sh"
	install -Dm755 "$_appname.csh" 	"$pkgdir/etc/profile.d/$_appname.csh"
}

# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=newitemmonitor
pkgver=1.0.3
pkgrel=1
epoch=
pkgdesc="通用型上新监控器，上新时获得通知"
arch=(x86_64 aarch64)
url="https://fatecore.com/p/nim/"
license=('private')
groups=()
depends=(electron4 bash)
makedepends=(asar npm)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("http://resource.fatecore.com/nim/nim-v1.0.3-win.zip"
        )
noextract=()
sha256sums=('37aa6933e5583833448f9e9410f54d39b27b55de0e5ef4969b6047eb692c5128')
validpgpkeys=()

prepare() {
	bsdtar -xvpf *.exe
	pushd resources
	asar e app.asar ./app
	pushd app
	npm i sqlite3@5.0.2
	rm -rf node_modules/node-gyp
}

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -av resources/app $pkgdir/opt/$pkgname/
	install -Dm755 /dev/null $pkgdir/usr/bin/newitemmonitor
	echo "#!/bin/sh" >> $pkgdir/usr/bin/newitemmonitor
	echo "electron4 /opt/$pkgname/app" >> $pkgdir/usr/bin/newitemmonitor
}

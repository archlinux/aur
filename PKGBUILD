pkgname=jazz2-git
pkgver=1.3.0+r24.bbb128f
pkgrel=1
pkgdesc="Jazz² Resurrection - Open-source Jazz Jackrabbit 2 reimplementation"
arch=(x86_64 aarch64)
url=http://deat.tk/jazz2/
license=(GPL3 custom:MIT/Expat)
depends=(libopenmpt openal)
makedepends=(mesa cmake glfw)
conflicts=(jazz2-bin)
install=jazz2.install
source=(
	git+https://github.com/deathkiller/jazz2-native.git
	https://archive.org/download/j2r_demo/Games.zip
	jazz2.{sh,png,desktop})
md5sums=(
	SKIP
	b5095a5ba6d2d7d20b2c4ff2a99301c5
	d569f65a05b3fc80bfcf036cc2ef6cc8
	10883cc01ae3a287a5804153092af9dd
	da8320edf25369c409cb98f662b04db2)
pkgver(){
	cd jazz2-native
	git describe --tags|sed 's/-\(.*\)-g/+r\1./'
}
build(){
	cd jazz2-native
	sh BuildLinuxGcc.sh
}
package(){
	install Jazz2-LinuxGcc-Release/jazz2 jazz2.sh -Dt "$pkgdir"/usr/bin
	install "Games/Jazz2 Secret Files Demo/"* -Dt "$pkgdir/usr/share/Jazz² Resurrection/Source"
	cp -r jazz2-native/Content Games/Jazz2Sw/* "$pkgdir/usr/share/Jazz² Resurrection"
	install jazz2.png -Dt "$pkgdir"/usr/share/pixmaps
	install jazz2.desktop -Dt "$pkgdir"/usr/share/applications
}

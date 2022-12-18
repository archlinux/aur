pkgname=jazz2-git-bin
pkgver=1.4.0+r16.f9302ef
pkgrel=1
pkgdesc="Jazz² Resurrection - Open-source Jazz Jackrabbit 2 reimplementation"
arch=(x86_64 aarch64)
url=http://deat.tk/jazz2/
license=(GPL3 MIT/Expat)
depends=(libopenmpt openal)
conflicts=(jazz2-{bin,git})
install=jazz2.install
_link=https://nightly.link/deathkiller/jazz2-native/workflows/linux`[ $CARCH = x86_64 ] || echo _cc`/master/Jazz2_Linux_`uname -m|sed s/86_//`_GLFW
source=(
	`curl -s $_link|grep actions/artifacts|cut -d\" -f4`
	https://archive.org/download/j2r_demo/Games.zip
	jazz2.{sh,png,desktop})
md5sums=(
	SKIP
	b5095a5ba6d2d7d20b2c4ff2a99301c5
	d569f65a05b3fc80bfcf036cc2ef6cc8
	10883cc01ae3a287a5804153092af9dd
	da8320edf25369c409cb98f662b04db2)
pkgver(){
	rm -fr jazz2-native
	git clone -n https://github.com/deathkiller/jazz2-native
	cd jazz2-native
	git checkout -q `curl -s $(curl -s $_link|grep View\ run|cut -d\" -f4)|grep commit/|cut -d\" -f4|cut -d/ -f5`
	git describe --tags|sed 's/-\(.*\)-g/+r\1./'
}
package(){
	install jazz2{,.sh} -Dt "$pkgdir"/usr/bin
	install "Games/Jazz2 Secret Files Demo/"* -Dt "$pkgdir/usr/share/Jazz² Resurrection/Source"
	cp -r Content Games/Jazz2Sw/* "$pkgdir/usr/share/Jazz² Resurrection"
	install jazz2.png -Dt "$pkgdir"/usr/share/pixmaps
	install jazz2.desktop -Dt "$pkgdir"/usr/share/applications
}

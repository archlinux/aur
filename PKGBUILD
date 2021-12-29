# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>
_pkgname=ki-shell
pkgname=ki-shell-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Kotlin Language Interactive Shell"
arch=('any')
url='https://github.com/Kotlin/kotlin-interactive-shell'
license=('Apache')
depends=('bash' 'java-runtime>=8')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://repo1.maven.org/maven2/org/jetbrains/kotlinx/$_pkgname/$pkgver/$_pkgname-$pkgver-archive.zip")
md5sums=('7b967da29f95154f32f35a5b1b1f23a3')

prepare() {
	cd "ki"
	sed -i "s|KI_SHELL=\$SCRIPT_DIR/../lib/ki-shell.jar|KI_SHELL=/usr/lib/${_pkgname}/${_pkgname}.jar|" bin/ki.sh
}

package() {
	cd "ki"
	install -Dm644 "lib/${_pkgname}.jar" -t "${pkgdir}/usr/lib/${_pkgname}"
	install -Dm755 "bin/ki.sh" -T "${pkgdir}/usr/bin/ki"
}

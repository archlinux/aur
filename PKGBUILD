# Maintainer: Maxr1998 <aur@maxr1998.de>
_pkgname=ki-shell
pkgname=ki-shell-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Kotlin Language Interactive Shell"
arch=('any')
url='https://github.com/Kotlin/kotlin-interactive-shell'
license=('Apache')
depends=('bash' 'java-runtime>=11')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://repo1.maven.org/maven2/org/jetbrains/kotlinx/$_pkgname/$pkgver/$_pkgname-$pkgver-archive.zip")
md5sums=('6c735c6edfb5e5190fd634f6dff797f6')

prepare() {
	cd "ki"
	sed -i "s|KI_SHELL=\$SCRIPT_DIR/../lib/ki-shell.jar|KI_SHELL=/usr/lib/${_pkgname}/${_pkgname}.jar|" bin/ki.sh
}

package() {
	cd "ki"
	install -Dm644 "lib/${_pkgname}.jar" -t "${pkgdir}/usr/lib/${_pkgname}"
	install -Dm755 "bin/ki.sh" -T "${pkgdir}/usr/bin/ki"
}

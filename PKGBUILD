# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libreoffice-extension-writingtool
pkgver=26.7
pkgrel=1
pkgdesc="WritingTool is a LibreOffice extension for LibreOffice that adds a writing assistant to text editing."
arch=('any')
url="https://github.com/writingtool-org/writingtool/"
license=('LGPL-2.1-only')
groups=('libreoffice-extensions')
depends=('java-runtime>=17' 'libreoffice' 'python' 'perl' 'bash')
install=$pkgname.install
makedepends=("maven" "java-environment=17")
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('320d843deb1e94d834fdb74447c8487107c0dd62bdee6b79925937301fcbb1a7')

prepare() {
	cd "$srcdir/${pkgname:22}-$pkgver"
}


build() {
	cd "$srcdir/${pkgname:22}-$pkgver"
	export PATH=/usr/lib/jvm/java-17-openjdk/bin:$PATH
	mvn package -DskipTests
}


package() {
	cd "$srcdir/${pkgname:22}-$pkgver"
	install -dm755 "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
	bsdtar -xf target/WritingTool-${pkgver}.zip -C "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
}

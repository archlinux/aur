# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libreoffice-extension-writingtool
pkgver=25.10
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
sha256sums=('83f16e99179fafe193749381f323783befe284a09d9c8b75390f1935ce7d88b0')

prepare() {
	cd "$srcdir/${pkgname:22}-$pkgver"
}


build() {
	cd "$srcdir/${pkgname:22}-$pkgver"
	export PATH=/usr/lib/jvm/java-17-openjdk/bin:$PATH
	mvn -X -Dmaven.wagon.http.ssl.insecure=true \
		-Dmaven.wagon.http.ssl.allowall=true \
		-Dmaven.wagon.http.ssl.ignore.validity.dates=true \
		-Dmaven.resolver.transport=wagon \
		package \
		-DskipTests
}


package() {
	cd "$srcdir/${pkgname:22}-$pkgver"
	install -dm755 "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
	bsdtar -xf target/WritingTool-${pkgver}.zip -C "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
}

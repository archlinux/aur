# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=uecide
pkgver=0.9.1
pkgrel=1
pkgdesc='Universal Embedded Computing IDE'
arch=('any')
url='https://uecide.org/'
license=('GPL2')
makedepends=('apache-ant' 'jdk8-openjdk')
depends=('java-environment>7')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname^^}/${pkgname^^}/archive/${pkgver}.tar.gz")
sha256sums=('380258455d05d652200d3c1650e2dcec8f80f4f47a115e207529e9eb24b2bef0')

build() {
	cd "${pkgname^^}-$pkgver"
	ant
}

package() {
	cd "${pkgname^^}-$pkgver"

	install -Dm 644 dist/linux/doc_icon.png   "$pkgdir/usr/share/icons/uecide_sketch.png"
	install -Dm 644 dist/linux/uecide.png     "$pkgdir/usr/share/icons/uecide.png"
	install -Dm 644 dist/linux/uecide.desktop "$pkgdir/usr/share/applications/uecide.desktop"
	install -Dm 644 uecide.jar                "$pkgdir/usr/share/uecide/uecide.jar"

	install -dm 755 "$pkgdir/usr/bin"
	cat <<EOF > "$pkgdir/usr/bin/uecide"
#!/bin/sh
java -jar /usr/share/uecide/uecide.jar "$@"
EOF
	chmod 755 "$pkgdir/usr/bin/uecide"
}

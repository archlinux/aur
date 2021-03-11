# Maintainer: Jonathon Fernyhough <jonathon_at m2x+dev>

pkgname=uecide
pkgver=0.11.9
pkgrel=1
pkgdesc='Universal Embedded Computing IDE'
arch=('any')
url='https://uecide.org/'
license=('GPL2')
makedepends=('apache-ant' 'jdk8-openjdk')
depends=('java-environment>8')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname^^}/${pkgname^^}/archive/${pkgver}.tar.gz")
b2sums=('c13f6958d3de5b6fde510ed6a0353cfc54a8fe8b8d6f8949b011b2b033e70e3fffcd3ab2ff3864a70180848ab97709c7f5f10b62e0e750d85dbe83feabe10c9c')

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

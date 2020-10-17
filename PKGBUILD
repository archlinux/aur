# Maintainer: Jonathon Fernyhough <jonathon_at m2x+dev>

pkgname=uecide
pkgver=0.11.8
pkgrel=1
pkgdesc='Universal Embedded Computing IDE'
arch=('any')
url='https://uecide.org/'
license=('GPL2')
makedepends=('apache-ant' 'jdk8-openjdk')
depends=('java-environment>8')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname^^}/${pkgname^^}/archive/${pkgver}.tar.gz")
b2sums=('f09e647fbf04088c98a2d6babc1ae22bd349ec39eba8a6971b277b780236c9d37fd346bb5d24fd882abfbce7f97a3c1c39d90be9fb688c263c45e47f28f343e0')

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

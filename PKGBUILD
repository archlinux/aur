# Maintainer: Eragon <eragon at eragon dot re>

pkgname=kernel-riot-api-git
_pkgname=kernel
pkgdesc='A plug & play Riot API proxy server'
pkgrel=0
pkgver=127.f769403
arch=('any')
conflicts=()
provides=('kernel-riot-api')
url='https://github.com/meraki-analytics/kernel'
license=('MIT')
depends=('jdk-openjdk>=8')
makedepends=('maven')
source=("launch.sh" "config.sh" "$_pkgname::git+https://github.com/meraki-analytics/kernel")
sha256sums=('937cab63fe8acf7e7adb1ee83939165ee86ff81eea7b96a925608d55cb1a8b10' '15d44fa8f03f1b7f0b5739ef5f3c7a87158d9fcdd9e690650ddd89e0c4cb79a9' 'SKIP')

pkgver() {
	cd $_pkgname
	echo "$(git rev-list --count HEAD).$(git rev-parse --verify --short HEAD)"
}

build() {
	cd $_pkgname
	mvn clean package

}

package() {
	cd $_pkgname
	install -D -m555 "$srcdir/$_pkgname/target/kernel-thorntail.jar" "$pkgdir/usr/lib/kernel-riot-api/kernel-thorntail.jar"
	install -D -m760 "$srcdir/$_pkgname/target/kernel-config.json" "$pkgdir/etc/kernel-riot-api/kernel-config.json"
	install -D -m555 "$srcdir/launch.sh" "$pkgdir/usr/bin/kernel-riot-api"
	install -D -m760 "$srcdir/config.sh" "$pkgdir/etc/kernel-riot-api/config.sh"
}

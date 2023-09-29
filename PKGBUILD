# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
_pkgname=mixing-station-pc
pkgname=$_pkgname-bin
pkgver=1.9.9
pkgrel=1
pkgdesc='Remote control digital mixers'
arch=(any)
url=https://mixingstation.app/
license=(unknown)
groups=()
depends=(java-runtime)
provides=($_pkgname)
conflicts=($_pkgname)
source=(
	$_pkgname.zip::https://mixingstation.app/backend/api/web/download/update/$_pkgname/release
	$_pkgname.desktop
	$_pkgname.png
	$_pkgname.sh
)
sha256sums=(SKIP
            '2f923b4a4d449e975bb4fa3fb6f8934df5eba9251a74f12932232f05d32bb1f6'
            '80e8008f52ddb51d3b069d5fb3aaebaef398d27a0224d60d31f3c03a796fd671'
            'b93eaaea70843227d0116f276127dcab83d07c1eac69af1c5c9424e8c602f5a5')

pkgver() {
	jar xf mixing-station-pc.jar META-INF/MANIFEST.MF
	sed -n 's/^Implementation-Version: //p' META-INF/MANIFEST.MF | tr -d '\r\n'
}

package() {
	install -Dm644 $_pkgname.jar     "$pkgdir"/usr/lib/$_pkgname.jar
	install -Dm644 $_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
	install -Dm644 $_pkgname.png     "$pkgdir"/usr/share/icons/$_pkgname.png
	install -Dm655 $_pkgname.sh      "$pkgdir"/usr/bin/$_pkgname
}

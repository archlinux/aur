# Maintainer: Brad Ackerman <brad@facefault.org>
# Contributor: David Koňařík <dvd.kon@gmail.com>
pkgname=fsharp-forge
pkgver=2.2.0
pkgrel=1
pkgdesc="F# CLI tool for project, file, and solution management"
arch=("any")
url="http://forge.run/"
license=("custom:unlicense")
depends=("mono")
makedepends=("fsharp")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ionide/Forge/archive/${pkgver}.tar.gz"
        "${pkgname}-issue105.patch::https://github.com/ionide/Forge/commit/9f5cc6c8d62f142de603dd63f3520717dba650c3.patch")
sha512sums=("2a56ab14721ced6787c7390feec9d201d22f58d69a97a68a0e49254095c0c79de2501d4aa4dba94238ebd76b08f748e1bd27bd505b64b911a7e3d93471758b1e"
            "20049c9d2947726638527f482175eedd808f30715d6a1b2f45a8373025ac65f9795c649ced3c1a1110c6ffc788205a2b97758348e217635fe25b65e20c0e55f3")

prepare() {
	cd "Forge-$pkgver"
	patch -p1 -i "$srcdir/${pkgname}-issue105.patch"
  chmod +x forge.sh
}

build() {
	cd "Forge-$pkgver"
	./build.sh
}

# check() {
# 	cd "Forge-$pkgver"
# 	make -k check
# }

package() {
	cd "Forge-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -a temp/* "${pkgdir}/usr/lib/${pkgname}"
  cp -a LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/lib/${pkgname}/forge.sh "${pkgdir}/usr/bin/forge"
}

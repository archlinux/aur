# Maintainer: metamer <metamer at openmailbox dot org>
pkgname=infra-arcana
pkgver=18.0
pkgrel=1
epoch=
pkgdesc="Roguelike game inspired by H.P. Lovecraft"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/infraarcana/home"
license=('custom:Infra Arcana License')
groups=()
depends=('sdl2_image' 'sdl2_mixer')
#checkdepends=('valgrind')
backup=()
options=()
install=
source=("https://github.com/InfraArcana/ia/archive/v${pkgver}.zip"
		"${pkgname}.sh")
md5sums=('7e72cb038257d07e03a6583930971d4e'
         '87294b81f5a2f98a78d318a5dcec7caf')

build() {
	cd "ia-${pkgver}"
	make
}

package() {
	cd "ia-$pkgver"

	install -DTm644 "target/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

	mkdir -p "${pkgdir}/opt/${pkgname}/"
	cp -R target/* "${pkgdir}/opt/${pkgname}/"
	# required to allow users to write saved games and high scores to data
	chmod -R a+w "${pkgdir}/opt/${pkgname}/data"

	# this shell script is required as the compiled binary relies on relative references
	install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

}

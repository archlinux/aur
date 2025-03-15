# Maintainer: Your Name <r.a.maksimovich@gmail.com>

pkgname=pshash
pkgver=0.1.14.6
pkgrel=1
epoch=
pkgdesc="A functional pseudo-hash password generator"
arch=('any')
url="https://github.com/thornoar/${pkgname}"
license=('MIT')
groups=()
depends=()
makedepends=("ghc" "help2man")
checkdepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
changelog=
source=("source.tar.gz::https://github.com/thornoar/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
validpgpkeys=()

prepare() {
	cd "${srcdir}/" || exit
}

build() {
	cd "${srcdir}/" || exit
	tar -xvzf "source.tar.gz"
	ghc --make -i${pkgname}-${pkgver}/lib ${pkgname}-${pkgver}/app/Main.hs -no-keep-o-files -no-keep-hi-files -o ${pkgname}
	help2man "./${pkgname}" --output "MAN-${pkgver}.1" --no-info
	gzip -f "MAN-${pkgver}.1"
}

package() {
	cd "${srcdir}/" || exit
	install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 ${pkgname}-${pkgver}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 ${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
sha256sums=('0b69affc5607911cd0f7c82bfba4e16b43a522376fe6fd83dd229834a3999811')

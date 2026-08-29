# Maintainer: Roman Maksimovich <r.a.maksimovich@gmail.com>

pkgname=pshash
pkgver=0.1.20.1
pkgrel=1
epoch=
pkgdesc="A functional pseudo-hash password generator"
arch=('any')
url="https://github.com/thornoar/${pkgname}"
license=('MIT')
groups=()
depends=("haskell-random")
makedepends=("ghc" "ghc-static" "ghc-libs" "haskell-random" "help2man")
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
	ghc -dynamic --make -i${pkgname}-${pkgver}/lib -i${pkgname}-${pkgver}/app ${pkgname}-${pkgver}/app/Main.hs -o ${pkgname}
	help2man "./${pkgname}" --output "MAN-${pkgver}.1" --no-info
	gzip -f "MAN-${pkgver}.1"
}

check() {
	cd "${pkgname}-${pkgver}/" || exit
	./test/output.sh "../${pkgname}"
	cd "${srcdir}/" || exit
}

package() {
	cd "${srcdir}/" || exit
	install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 ${pkgname}-${pkgver}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 ${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
sha256sums=('fb6aa27a7761fa7b6a104e8da7c90f85792363d943b5dc35a5781300c2f88e44')

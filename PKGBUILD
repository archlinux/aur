# Maintainer: Luke Cotton <aur at cotton dot org dot uk>
pkgname=unbted
pkgver=1.2.1
_pkgjar="${pkgname}-${pkgver}.jar"
pkgrel=1
pkgdesc="Una's NBT Editor - an advanced interactive command-line NBT editor"
arch=('any')
url="https://github.com/unascribed/unbted"
license=('GPL-3.0-only' 'Apache-2.0' 'MIT')
depends=()
makedepends=('gradle<9' 'java-environment<=17')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}"
)
noextract=()
sha256sums=(
        'e821b897ddd49cfe0e2a50998a9e8156b448f34ed6948f185f9cc86fd3c57d38'
        '56665e9227b213bd42fe7cffb5c955a55ab4ceb2573aeb8b84eda7a54a73945d'
)
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	# Suppress Gradle's welcome message on first build
	gradle --version > /dev/null
	gradle build
}

package() {
	depends=('java-runtime>=17' 'sh')
	install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
	cd "$pkgname-$pkgver"
	install -Dm644 "build/libs/${_pkgjar}" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -Dm644 "opennbt-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}


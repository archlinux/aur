# Maintainer: Luke Cotton <aur at cotton dot org dot uk>
pkgname=unbted
pkgver=1.2.2
pkgrel=1
pkgdesc="Una's NBT Editor - an advanced interactive command-line NBT editor"
arch=('any')
url="https://git.sleeping.town/unascribed/${pkgname}"
license=('GPL-3.0-only' 'Apache-2.0' 'MIT')
depends=()
makedepends=('java-environment=8')
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
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"${pkgname}.sh"
)
noextract=()
sha256sums=(
        'bcc84c62fa3723857c199915c375d72b51d82fa0efdc34f0518bb32df148e5f0'
        'a3437bc297bd9a3754c4c975563b9a0676cbc06c2a3ff5f21766b74fcb8c9d46'
)
validpgpkeys=()

build() {
        export JAVA_HOME=$(ls -d /usr/lib/jvm/*-8-*)
	cd "$srcdir/$pkgname"

	# Suppress Gradle's welcome message on first build
        ./gradlew --version > /dev/null
        ./gradlew build
}

package() {
	depends=('java-runtime>=8' 'sh')
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	cd "${pkgname}"
	install -Dm644 "build/libs/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -Dm644 "opennbt-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}


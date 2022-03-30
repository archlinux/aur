# Maintainer: Vladimir Sandomirskii <complover116 at gmail dot com>
pkgname=cvmconfigurator-git
pkgver=0.8.2.r0.g890fbeb
pkgrel=1
pkgdesc="A configuration utility for managing CVMEngine versions"
arch=('any')
url="https://gitlab.com/cvmproject/cvmconfigurator"
license=()
groups=()
depends=("jre11-openjdk")
makedepends=("jdk11-openjdk" "git")
optdepends=(
	"android-sdk-build-tools: Android support"
	"android-sdk-cmdline-tools-latest: Android support"
	"android-sdk-platform-tools: Android support"
)
provides=("cvmconfigurator-git")
conflicts=("cvmconfigurator-git")
replaces=()
backup=()
options=()
# install=
# changelog=
source=('cvmconfigurator-git::git+https://gitlab.com/cvmproject/cvmconfigurator.git' 'cvmconfigurator')
noextract=()
sha256sums=('SKIP' 'SKIP')

build() {
	cd "$pkgname"
	export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
	./gradlew createProperties
	./gradlew jar
}

pkgver() {
	cd "$pkgname"
	git describe --tags --long | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
	mkdir -p "$pkgdir"/usr/bin
	install --mode=755 cvmconfigurator "$pkgdir"/usr/bin/cvmconfigurator
	cd "$pkgname"
	mv build/libs/*.jar cvmconfigurator.jar
	mkdir -p "$pkgdir"/usr/share/java/cvmconfigurator/
	install cvmconfigurator.jar "$pkgdir"/usr/share/java/cvmconfigurator/cvmconfigurator.jar
}

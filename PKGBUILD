# Maintainer: ccat3z <c0ldcat3z@gmail.com>

_pkgname=mirror-sync

pkgname=${_pkgname}-git
pkgver=1.3.8.r3.a15df13
pkgrel=1
pkgdesc="A tool for real-time, two-way sync for remote (e.g. desktop/laptop) development"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
arch=("x86_64")
url="https://github.com/stephenh/mirror"
license=('APACHE')
depends=('jre8-openjdk-headless' 'watchman')
makedepends=('jdk8-openjdk')
source=("${_pkgname}::git+https://github.com/stephenh/mirror.git"
        "mirror")
noextract=('mirror-all.jar')
sha256sums=('SKIP'
            '026dde44b41c2f21d3cfe36ce957928f1f89bce18cf8bbea49f3407af7ed05a1')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --tags --exclude='*-*' --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_pkgname}"
    ./gradlew clean check shadowJar
}

package() {
    install -Dm 755 ./mirror $pkgdir/usr/bin/mirror
    install -Dm 755 ${_pkgname}/build/libs/${_pkgname}-all.jar $pkgdir/usr/share/java/mirror/mirror-all.jar
}

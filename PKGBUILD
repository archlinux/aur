# Maintainer: Adrian Wheeldon <arandomowl at gmail dot com>
pkgname=workcraft-git
pkgver=3.1.2
pkgrel=1
pkgdesc="A framework for interpreted graph models including petri nets and STGs"
arch=('i686' 'x86_64')
url="http://www.workcraft.org/"
license=('GPL')
makedepends=('git' 'java-environment')
depends=('java-runtime')
provides=('workcraft')
conflicts=('workcraft')
source=(git+https://github.com/tuura/workcraft.git workcraft_start.sh)
md5sums=('SKIP' '48f63dfedeeaac4dd8ccde2d2822fefc')
pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$srcdir/${pkgname%-VCS}"
	./gradlew assemble
}
package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "${pkgdir%-git}"/usr/bin
	mkdir -p "${pkgdir%-git}"/opt/workcraft
	cp -RP workcraft/* "${pkgdir%-git}"/opt/workcraft/
	cp workcraft_start.sh "${pkgdir%-git}"/usr/bin/workcraft
	chmod 755 "${pkgdir%-git}/usr/bin/workcraft"
}

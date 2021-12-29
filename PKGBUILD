#!/hint/bash
# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>

pkgname=dart-sass-embedded
pkgver=1.0.0_beta.14
pkgrel=2
pkgdesc="Wrapper for Dart Sass that implements the compiler side of the Embedded Sass protocol"
arch=("x86_64")
url="https://github.com/sass/dart-sass-embedded"
license=('MIT')
groups=()
depends=('glibc')
makedepends=('dart')
replaces=()
backup=()
options=('!strip')
source=("${pkgname}-${pkgver}.tgz::https://github.com/sass/${pkgname^^}/archive/${pkgver//_/-}.tar.gz")
noextract=()
sha256sums=('f391ea6cd284ffbebf5c15cd8d9e48e657df03fe60cd3a355dfbe87438791761')


prepare() {
	dart --disable-analytics
	cd ${pkgname}-${pkgver//_/-}
	dart pub get
	dart pub run grinder protobuf
}
build() {
	cd ${pkgname}-${pkgver//_/-}
	mkdir -p ${srcdir}/build
	dart compile exe -o ${srcdir}/build/${pkgname} bin/dart_sass_embedded.dart
}

package() {
	install -Dm755 ${srcdir}/build/${pkgname} -t ${pkgdir}/usr/bin/
	install -Dm644 ${pkgname}-${pkgver//_/-}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}

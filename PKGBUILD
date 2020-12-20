# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=musicfox
pkgver=1.2.0
pkgrel=1
pkgdesc="netease cloud music terminal client written in Dart."
arch=('x86_64')
url="https://github.com/AlanAlbert/musicfox"
license=('MIT')
depends=('mpg123'
         'libnotify')
makedepends=('dart')
provides=("${pkgname}-bin")
conflicts=("${pkgname}-bin")
options=('!strip')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/AlanAlbert/musicfox/archive/${pkgver}.tar.gz")
sha256sums=('be84b4db8841f9b03e86a70b9000c7a1fa8db417641e460f6d810b0959bc0fd5')


build() {
  cd ${pkgname}-${pkgver}

  # get dependency
  dart pub get

  # start build
  mkdir -p ${srcdir}/build
  dart compile exe -o ${srcdir}/build/${pkgname} bin/main.dart
}

package() {
  install -Dm755 build/${pkgname} -t ${pkgdir}/usr/bin
  install -Dm644 ${pkgname}-${pkgver}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim: set sw=2 ts=2 et:

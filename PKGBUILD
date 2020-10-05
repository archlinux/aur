# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Elaina Martineau <elainamartineau@gmail.com>

pkgname=bsnes-qt5
pkgver=115
pkgrel=2
pkgdesc='Super Nintendo emulator focusing on performance, features, and ease of use (Qt 5).'
arch=('x86_64')
url='https://byuu.org/emulation/bsnes/'
license=('GPL3')
depends=('qt5-base' 'libpulse' 'libxv' 'libao' 'openal' 'sdl2')
conflicts=('bsnes-classic' 'bsnes-plus' 'bsnes')
source=("https://github.com/bsnes-emu/bsnes/archive/v${pkgver}.tar.gz" 'package.patch')
sha256sums=('e51d25f95b8fbcb91470b3dc8844d87206b74f3a164e41e6db271601e0cff93c'
            'f391b8ce83ed1dfe93d83484464613de1fa1c454d69b02c5234efc9ef69fd3bb')

prepare() {
  cd "bsnes-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/package.patch" --ignore-whitespace
}

build() {
  cd "bsnes-${pkgver}"
  make -C bsnes hiro=qt5 moc=/usr/bin/moc
}

package() {
  cd "bsnes-${pkgver}"
  make -C bsnes hiro=qt5 moc=/usr/bin/moc prefix="${pkgdir}/usr" install
}

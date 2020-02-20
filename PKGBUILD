# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Elaina Martineau <elainamartineau@gmail.com>

pkgname=bsnes-qt5
pkgver=114
pkgrel=1
pkgdesc='Super Nintendo emulator focusing on performance, features, and ease of use.'
arch=('x86_64')
url='https://byuu.org/emulation/bsnes/'
license=('GPL3')
depends=('qt5-base' 'libpulse' 'libxv' 'libao' 'openal' 'sdl2')
conflicts=('bsnes-classic' 'bsnes-plus' 'bsnes')
source=("https://download.byuu.org/bsnes_v${pkgver//./r}-source.zip" 'package.patch')
sha256sums=('b6868e4bf63d912be94b66546cf5470831aceb3fc1b2bd0564b7f6d9b084ac0e'
            'f391b8ce83ed1dfe93d83484464613de1fa1c454d69b02c5234efc9ef69fd3bb')

prepare() {
  cd "bsnes_v${pkgver//./r}-source"
  patch --forward --strip=1 --input="${srcdir}/package.patch" --ignore-whitespace
}

build() {
  cd "bsnes_v${pkgver//./r}-source"
  make -C bsnes hiro=qt5 moc=/usr/bin/moc
}

package() {
  cd "bsnes_v${pkgver//./r}-source"
  make -C bsnes hiro=qt5 moc=/usr/bin/moc prefix="${pkgdir}/usr" install
}

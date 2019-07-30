# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Elaina Martineau <elainamartineau@gmail.com>

pkgname=bsnes-qt5
pkgver=108
pkgrel=1
pkgdesc='Super Nintendo emulator focusing on performance, features, and ease of use.'
arch=('x86_64')
url='https://byuu.org/emulation/bsnes/'
license=('GPL3')
depends=('qt5-base' 'libpulse' 'libxv' 'libao' 'openal' 'sdl2')
conflicts=('bsnes-classic' 'bsnes-plus' 'bsnes')
source=("https://download.byuu.org/bsnes_v${pkgver//./r}-source.7z" 'package.patch')
sha256sums=('49c560b8438d0ea3942b1cd90ac3d4b5a33074eca77a0b24a7af463e87187bec'
            'e800849a4e6c9b431578c2c55bfaab7b0619629ba34bd97f38bae64d5f2412d6')

prepare() {
  cd "bsnes_v${pkgver//./r}-source"

  patch --forward --strip=1 --input="${srcdir}/package.patch"
}

build() {
  cd "bsnes_v${pkgver//./r}-source"

  make -C bsnes hiro=qt5 moc=/usr/bin/moc
}

package() {
  cd "bsnes_v${pkgver//./r}-source"

  make -C bsnes hiro=qt5 moc=/usr/bin/moc prefix="${pkgdir}/usr" install
}

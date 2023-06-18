# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Elaina Martineau <elainamartineau@gmail.com>

pkgname=bsnes-qt5
pkgver=20230610
_commit=7ec3077079445c1ab591d542d475da5fa121632e
pkgrel=1
pkgdesc='Super Nintendo emulator focusing on performance, features, and ease of use. (Qt 5)'
arch=(x86_64)
url='https://github.com/bsnes-emu/bsnes'
license=(GPL3)
depends=(qt5-base libpulse libxv libao openal sdl2)
makedepends=(git)
conflicts=(bsnes bsnes-classic bsnes-hd bsnes-plus)
provides=(bsnes)
source=("bsnes::git+https://github.com/bsnes-emu/bsnes.git#commit=$_commit"
         package.patch)
sha256sums=('SKIP'
            '12ed11da832105fd2424d4110a29b8bac546e36aceaf9196cc9290cef9706c85')

prepare() {
  cd "bsnes"
  patch --forward --strip=1 --input="${srcdir}/package.patch" --ignore-whitespace
}

build() {
  cd "bsnes"
  make -C bsnes hiro=qt5 moc=/usr/bin/moc
}

package() {
  cd "bsnes"
  make -C bsnes hiro=qt5 moc=/usr/bin/moc prefix="${pkgdir}/usr" install
}

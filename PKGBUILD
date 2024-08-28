# Maintainer: John Downey <jdowney@gmail.com>
pkgname=plater
pkgver=1.0.0
pkgrel=2
epoch=
pkgdesc="3D-printer parts placer and plate generator"
arch=("x86_64")
url="https://github.com/Rhoban/Plater"
license=("custom:CC BY-NC")
groups=()
depends=("libffi")
makedepends=("cmake")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Rhoban/Plater/archive/v$pkgver.tar.gz"
        "add-cstdint-header.patch")
noextract=()
sha256sums=('4baafed6fe779dc0711dbcb0385dbe96f2212f343f419fe98e4e5f394ad3bfc9'
            'a1122c11eb11e6338c9b72b0a53e398d748b317019407db7668768759a1ff871')
validpgpkeys=()

prepare() {
  patch -Np1 -i ../add-cstdint-header.patch
}

build() {
  cd "Plater-$pkgver/plater"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "Plater-$pkgver/plater/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

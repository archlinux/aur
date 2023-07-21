# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=libsunspec
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A C++ library for SunSpec compatible inverters, meters and batteries" 
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://ahpohl.github.io/libsunspec/"
license=('GPL3')
groups=()
depends=('libmodbus')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/libsunspec.git#tag=v${pkgver}")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -d "$pkgdir"/usr/include/$pkgname
  install -Dm644 include/* "$pkgdir"/usr/include/$pkgname
}

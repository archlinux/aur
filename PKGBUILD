# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=seer-gdb
pkgver=2.7
pkgrel=1
pkgdesc="A gui frontend to gdb"
arch=('x86_64' 'aarch64')
url="https://github.com/epasveer/seer.git"
license=(GPL-3.0-or-later)
depends=('libstdc++' 'libgcc' 'gdb' 'glibc' 'hicolor-icon-theme'  'qt6-base' 'qt6-charts')
makedepends=('git' 'cmake' 'qt6-svg')
provides=('seergdb')
source=("${pkgname}::git+https://github.com/epasveer/seer.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cmake -B build -S ${pkgname}/src \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCONFIG_SEER_INSTALL_ICONS=1 \
    -Wno-dev
    
    cmake --build build -t seergdb
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	cd "$srcdir/${pkgname}/src/resources"
        install -Dm644 'seergdb.desktop' -t "$pkgdir/usr/share/applications"
}



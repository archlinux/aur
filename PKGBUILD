# Maintainer: thynkon <thynkon at protonmail dot com>
pkgname=poac
pkgver=0.10.0
pkgrel=1
pkgdesc="Package manager for C++ like Cargo for Rust"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://poac.dev"
license=('Apache-2.0')
depends=('git' 'tar' 'python-cpplint' 'clang' 'libgit2' 'nlohmann-json' 'onetbb' 'fmt')
makedepends=('make' 'curl' 'pkg-config')
conflicts=('poac-devel-git' 'poac-git')
source=("$pkgname"-"$pkgver".tar.gz::https://github.com/poac-dev/poac/archive/"$pkgver".tar.gz)
sha256sums=('4bdede67b28f9622c071bef8c7eae76062c9ef2ad122deee49d994668e846288')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make CXX=/usr/bin/clang++ PREFIX=/usr RELEASE=1 all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir/" PREFIX=/usr install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

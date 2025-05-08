# Maintainer: thynkon <thynkon at protonmail dot com>
pkgname=cabin
pkgver=0.12.1
pkgrel=1
pkgdesc="A package manager and build system for C++"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://cabinpkg.com"
license=('Apache-2.0')
depends=('python-cpplint' 'libgit2' 'nlohmann-json' 'onetbb' 'clang' 'spdlog') # clang is required due to clang-format runtime dependency
makedepends=('git' 'make' 'curl' 'pkg-config' 'fmt')
conflicts=('cabin-git')
source=("$pkgname"-"$pkgver".tar.gz::https://github.com/cabinpkg/${pkgname}/archive/"$pkgver".tar.gz)
sha256sums=('a8e038452b28880a464885dcbfe515441e0a066e673d3cce5df46871ad4fa38f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr RELEASE=1 all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir/" PREFIX=/usr install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

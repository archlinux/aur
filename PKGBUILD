# Maintainer: Lubosz Sarnecki <lubosz at gmail dot com>

pkgname=superfamiconv-git
pkgver=0.9.2.r2.9f6bcab
pkgrel=1
pkgdesc='A tile graphics converter with flexible and composable command line options.'
arch=(x86_64)
url=https://github.com/Optiroc/SuperFamiconv
license=(MIT)

depends=(
  gcc-libs
)

makedepends=(
  cmake
  git
)
provides=(superfamiconv)
conflicts=(superfamiconv)
source=("git+https://github.com/Optiroc/SuperFamiconv.git")
sha256sums=(SKIP)

pkgver() {
  cd SuperFamiconv
  git describe --tags | sed 's/^v//; s/-dev//; s/-/.r/; s/-g/./'
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../SuperFamiconv \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  # make DESTDIR="${pkgdir}" -C build install
  install -Dm755 build/superfamiconv ${pkgdir}/usr/bin/superfamiconv
  install -Dm644 "$srcdir/SuperFamiconv/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:

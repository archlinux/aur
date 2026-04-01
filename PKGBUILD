# Maintainer: Suletta Mercury <hazfen@proton.me>

pkgname=nekofs-git
_pkgname=nekofs
pkgver=r4.2d3b549
pkgrel=1
pkgdesc="Virtual FUSE FileSystem with lots of automations"
arch=('x86_64')
url="https://github.com/NekoMimiOfficial/nekofs"
license=('custom:Nekocense')
makedepends=(
	cmake
	git
	nlohmann-json
	pkgconf
)
depends=(
	fuse3
	libcurlpp-git
)
pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

source=("git+${url}.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  cmake -B ../build -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build ../build
}

package() {
  install -d "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/build/NekoFS" "$pkgdir/usr/bin/nekofs"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


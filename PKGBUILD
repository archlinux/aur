# Maintainer: Daniel Dimijian <jetfrog28@yahoo.com>
_prjctname=GodotPckTool
pkgname=godotpcktool
pkgver=2.2
pkgrel=1
pkgdesc="A standalone executable for unpacking and packing Godot .pck files"
arch=('x86_64')
url="https://github.com/hhyyrylainen/GodotPckTool"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'cxxopts' 'nlohmann-json')
# source unsigned.  git commits are signed, but I can't find the public key for the tagged commits
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bfbc6bb9e810707bd3db0bfa95b29fa02cae40e297e319287f14e3b04961bb7c')

# Arch now sets pack-relative-relocs flag by default in LDFLAGS (RFC 0023).
# ld.gold is incompatible with the pack-relative-relocs flag, and is explicitly
# set by upstream in src/CMakeLists (line 32).
LDFLAGS=${LDFLAGS/-Wl,-z,pack-relative-relocs}

build() {
	cd "$_prjctname-$pkgver"
	make install-local
}

package() {
	cd "$_prjctname-$pkgver"
	install -Dm755 "install/bin/godotpcktool" "$pkgdir/usr/bin/godotpcktool"
	install -Dm644 "install/bin/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

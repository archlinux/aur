# Maintainer: David Lazarescu <prtnprvtmail@protonmail.com>
pkgname='librum'
pkgver=v.0.9.1
pkgrel=5
pkgdesc="A modern e-book reader and library manager"
arch=(x86_64)
url="https://librumreader.com"
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'gcc-libs' 'glibc' 'krb5' 'brotli' 'zstd' 'zlib' 'libproxy' 'libglvnd' 'libx11' 'glib2' 'libxkbcommon' 'libpng' 'harfbuzz' 'md4c' 'freetype2' 'systemd-libs' 'double-conversion' 'libb2' 'pcre2' 'openssl' 'e2fsprogs' 'keyutils' 'expat' 'libxcb' 'dbus' 'graphite' 'bzip2' 'libcap' 'libgcrypt' 'xz' 'lz4' 'curl' 'duktape' 'libffi' 'libxau' 'libxdmcp' 'libgpg-error' 'libnghttp2' 'libidn2' 'libpsl' 'util-linux-libs' 'libunistring')
makedepends=('git' 'make' 'cmake' 'gcc' 'unzip' 'python3')
source=(Librum::"git+https://github.com/Librum-Reader/Librum.git")
md5sums=('SKIP')


pkgver() {
  cd "Librum"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "Librum"
    git submodule update --init --recursive
}

build() {
	cd "Librum"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=Off .
    cmake --build .
}

package() {
	cd "Librum"
	DESTDIR="$pkgdir" cmake --install .
}

# Maintainer: Vaughan <vaughanm1@protonmail.com>
# Former maintainer: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=netcoredbg
_pkgver="3.0.0-1018"
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='Debugger for .NET Core runtime'
url='https://github.com/Samsung/netcoredbg'
license=("MIT")
arch=("x86_64")
depends=("dotnet-host>=7" "dotnet-runtime>=7")
makedepends=("git" "cmake" "clang" "dotnet-sdk>=7")
optdepends=()
source=("$pkgname-$_pkgver.tar.gz::https://github.com/Samsung/netcoredbg/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=("5f372a83f5cc07387b91f1752b05b72c728af8950c72dc89e1ee52e51302353c")

build() {
  cd "$pkgname-$_pkgver"

  mkdir -p build; cd build

  export CC=clang
  export CXX=clang++

  cmake \
    -DDOTNET_DIR=/usr/share/dotnet \
    -DCMAKE_INSTALL_PREFIX=/usr/bin ..

  make
}

package() {
  cd "$pkgname-$_pkgver"
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  
  cd build
  make install DESTDIR="$pkgdir"
}

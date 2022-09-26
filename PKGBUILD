# Maintainer: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=netcoredbg
_ver=2.2.0-947
pkgver=${_ver//-/_}
pkgrel=1
pkgdesc='Debugger for .NET Core runtime'
url='https://github.com/Samsung/netcoredbg'
license=("MIT")
arch=("x86_64")
depends=("dotnet-host>=3.1" "dotnet-runtime>=3.1")
makedepends=("git" "cmake" "clang" "dotnet-sdk>=3.1")
optdepends=()
source=("$pkgname-$_ver.tar.gz::https://github.com/Samsung/netcoredbg/archive/refs/tags/$_ver.tar.gz")
sha256sums=("bc9fb1d99fecc5c7deccd4a11d8d3100c907c69e044bf4be27e48641911079fd")

build() {
  cd "$pkgname-$_ver"
  mkdir -p build; cd build

  export CC=clang
  export CXX=clang++

  cmake \
    -DDOTNET_DIR=/usr/share/dotnet \
    -DCMAKE_INSTALL_PREFIX=/usr/bin ..

  make
}

package() {
  cd "$pkgname-$_ver"
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  
  cd build
  make install DESTDIR="$pkgdir"
}

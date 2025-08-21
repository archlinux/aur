# Maintainer:
# Contributor: Dennis Hamester <dennis.hamester@startmail.com>

_pkgname="scrawpp"
pkgname="$_pkgname"
pkgver=0.2.1
pkgrel=3
pkgdesc="Steam Controller C++ library"
url="https://gitlab.com/dennis-hamester/scrawpp"
license=('ISC')
arch=('any')

depends=(
  'scraw'
)
makedepends=(
  'cmake'
  'ninja'
)

_pkgsrc="$_pkgname-v$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/-/archive/v$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('5a692508b6ee6e321fa2ae5aa7f99bee38900caf2f634e9e212e342038ab155d')

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

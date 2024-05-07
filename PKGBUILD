# Maintainer:
# Contributor: Charles L <charles@crwl.org>
# Contributor: Sanpi <sanpi+aur@homecomputing.fr>

_pkgname="emsdk"
pkgname="$_pkgname"
pkgver=3.1.59
pkgrel=1
pkgdesc='The Emscripten SDK'
url="https://github.com/emscripten-core/emsdk"
license=('MIT')
arch=('x86_64')

depends=(
  'python'
  'cmake'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"https://github.com/emscripten-core/emsdk/archive/${pkgver}.$_pkgext"
  'emsdk'
  'emsdk_env.sh'
)
sha256sums=(
  '47515d522229a103b7d9f34eacc1d88ac355b22fd754d13417a2191fd9d77d5f'
  'd58940585324e582621a8ac5e28e913beee14a0b8e307f5413a6b0dcd6d2a139'
  'cd14a9107ca2cd92ec7ab2e44b8ca86ae71e81e744d700b49e75fbcb9717b5ce'
)

package() {
  install -Dm755 emsdk emsdk_env.sh -t "$pkgdir/usr/bin/"

  cd "$_pkgsrc"
  for file in emsdk emsdk.py *.json *.txt emsdk_env.*; do
    install -Dm755 "$file" -t "$pkgdir/usr/lib/$_pkgname/"
  done

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

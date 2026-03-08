# Maintainer: Tasin Farhan <tasinfarhan1016@gmail.com>
# Contributor: Nicholas Wang <me@nicho1as.wang>
# Contributor: Charles L <charles@crwl.org>
# Contributor: Sanpi <sanpi+aur@homecomputing.fr>

_pkgname="emsdk"
pkgname="$_pkgname"
pkgver=5.0.2
pkgrel=1
pkgdesc='The Emscripten SDK'
url="https://github.com/emscripten-core/emsdk"
license=('MIT')
arch=('any')

depends=(
  'python'
  'cmake'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"https://github.com/emscripten-core/emsdk/archive/${pkgver}.$_pkgext"
)
sha256sums=('7207d2f939416b19dc2e1a1ef9d012579c6e0d628da485dbcd5075c5f2c90292')

package() {
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/emsdk" <<END
#!/bin/sh
cd "/usr/lib/emsdk"
./emsdk "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/emsdk_env.sh" <<END
#!/bin/sh
source /usr/lib/emsdk/emsdk_env.sh
END

  cd "$_pkgsrc"
  for file in emsdk emsdk.py *.json *.txt emsdk_env.*; do
    install -Dm755 "$file" -t "$pkgdir/usr/lib/$_pkgname/"
  done

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

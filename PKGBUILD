# Maintainer: Nicholas Wang <me@nicho1as.wang>
# Contributor: Charles L <charles@crwl.org>
# Contributor: Sanpi <sanpi+aur@homecomputing.fr>

_pkgname="emsdk"
pkgname="$_pkgname"
pkgver=3.1.70
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
sha256sums=('5aa3fcdfbc3812419e9c73a5147ca9f9fdda897e05f24161813df14b35fcd7a5')

package() {
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/emsdk" << END
#!/bin/sh
cd "/usr/lib/emsdk"
./emsdk "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/emsdk_env.sh" << END
#!/bin/sh
source /usr/lib/emsdk/emsdk_env.sh
END

  cd "$_pkgsrc"
  for file in emsdk emsdk.py *.json *.txt emsdk_env.*; do
    install -Dm755 "$file" -t "$pkgdir/usr/lib/$_pkgname/"
  done

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

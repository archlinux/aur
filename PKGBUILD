# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-uuid' 'lua51-uuid' 'lua52-uuid' 'lua53-uuid' 'lua54-uuid')
_pkgbase='uuid'
pkgver=1.0.0
pkgrel=1
arch=('any')
url='https://github.com/Tieske/uuid'
license=('MIT')
pkgdesc="A pure Lua uuid generator"
_archive="${_pkgbase}-${pkgver}"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Tieske/uuid/archive/refs/tags/$pkgver.tar.gz")

_package() {
    pkgdesc+=" for Lua ${1}"
    depends=("${pkgname%-*}")
    optdepends=("${pkgname%-*}-system: RNG implementation"
                "${pkgname%-*}-socket: time source for seed generation")

    cd "${_archive}"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 -d  "$pkgdir/usr/share/lua/${1}"

    cd src
    install -Dm644 uuid.lua "$pkgdir/usr/share/lua/$1/uuid.lua"
    find uuid -type d | while read dir ; do
      install -Dm755 -d "$pkgdir/usr/share/lua/$1/$dir"
      if test -n "$(find $dir -mindepth 1 -maxdepth 1 -name '*.lua' -print -quit)" ; then
          install -Dm644 $dir/*.lua "$pkgdir/usr/share/lua/$1/$dir"
      fi
    done

}

package_lua-uuid() {
    _package 5.5
}

package_lua54-uuid() {
    _package 5.4
}

package_lua53-uuid() {
    _package 5.3
}

package_lua52-uuid() {
    _package 5.2
}

package_lua51-uuid() {
    _package 5.1
}

sha512sums=('93d996e5d580d37fa7e2c70f748f2af13660bf6354dc21982874285f3c69d5c2a76f4af99f30b85125213ed3f1ca207a919f623edf36ba2e60ab76e2d1c9acf7')

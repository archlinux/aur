# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_pkgname=lua52-jwtjitsi
pkgname=lua52-jwtjitsi-git
provide=("$_pkgname")
pkgver=3.0.r1.gb0f3bdc
pkgrel=1
pkgdesc='LUA JWT Jitsi'
arch=('any')
url='https://github.com/jitsi/luajwtjitsi'
license=('MIT')
depends=('lua52-cjson' 'lua52-base64' 'lua52-luaossl')
makedepends=('luarocks' 'lua52' 'git')
source=("git+https://github.com/jitsi/luajwtjitsi")
sha256sums=('SKIP')

pkgver() {
  cd "luajwtjitsi"
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "luajwtjitsi"
    luarocks make --pack-binary-rock --lua-version="5.2" --deps-mode=none luajwtjitsi*.rockspec
}

package() {
    cd "luajwtjitsi"
    luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none --no-manifest *.rock
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}



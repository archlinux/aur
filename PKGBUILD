# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=lua-wsapi-xavante
_rockname=wsapi-xavante
_reponame=wsapi
pkgver=1.7
pkgrel=1
pkgdesc="WSAPI is an API that abstracts the web server from Lua web applications. This is the rock that contains the Xavante adapter and launcher."
arch=('i686' 'x86_64')
url="http://keplerproject.github.com/wsapi"
license=('MIT')
depends=('lua' 'lua-wsapi' 'lua-xavante')
makedepends=('luarocks')
conflicts=()
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/keplerproject/${_reponame}/archive/v${pkgver}.tar.gz")
md5sums=('aacadf9dabeb82b044cb3f1006c5df0d')

build() {
  cd "$_reponame-$pkgver"
  luarocks make --pack-binary-rock --deps-mode=none "rockspec/$_rockname-$pkgver-1.rockspec"
}

package() {
  luarocks install --tree="$pkgdir/usr/" --deps-mode=none "$_reponame-$pkgver"/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

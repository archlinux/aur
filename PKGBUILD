# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

_author=isac322
_pkgname=tcafe-attending-bot
pkgname=python-${_pkgname}
pkgver=0.1.2
pkgrel=2
pkgdesc='Auto attending bot for TCafe'
arch=('any')
url="https://github.com/$_author/$_pkgname"
license=('MIT')
depends=('python-aiohttp' 'python-beautifulsoup4' 'python-xdg')
makedepends=('python-setuptools')
source=(
  "https://github.com/$_author/$_pkgname/archive/v${pkgver//_/-}.tar.gz"
  'tcafe-attending-bot.service'
  'tcafe-attending-bot.timer'
)
md5sums=(
  'efafd197a3ccfcb85bf457adfd69cb30'
  'b5220259c812f40008c32ba2197eaaa6'
  '5113cae7b56b347df7c2f67ea752f4b5'
)

build() {
  cd "$_pkgname-${pkgver//_/-}"
  python setup.py build
}

package() {
  cd "$_pkgname-${pkgver//_/-}"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  _systemdbasedir="$pkgdir/usr/lib/systemd/system"

  install -Dm644 ../tcafe-attending-bot.service "$_systemdbasedir/tcafe-attending-bot.service"
  install -Dm644 ../tcafe-attending-bot.timer "$_systemdbasedir/tcafe-attending-bot.timer"
}

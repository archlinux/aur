# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

_author=isac322
_pkgname=tcafe-attending-bot
pkgname=python-${_pkgname}
pkgver=0.1.0
pkgrel=1
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
  'b34178fae9cec668a3fc60cc021f0740'
  'b5220259c812f40008c32ba2197eaaa6'
  '92f1e03e3305dd4b1ed4c5fc86f22d95'
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

  install -Dm644 tcafe-attending-bot.service "$_systemdbasedir/tcafe-attending-bot.service"
  install -Dm644 tcafe-attending-bot.timer "$_systemdbasedir/tcafe-attending-bot.timer"
}

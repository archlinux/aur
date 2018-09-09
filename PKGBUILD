# Maintainer: Rhys Kenwell <redrield+aur@gmail.com>

pkgname=heroku-cli
pkgver=7.14.4
_builddir=cli-${pkgver}
pkgrel=2
pkgdesc="a tool for creating and managing Heroku apps from the command line"
arch=('x86_64')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
depends=('nodejs')
makedepends=('npm')
optdepends=('git: Deploying to Heroku')
conflicts=('heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("https://registry.npmjs.org/heroku/-/heroku-$pkgver.tgz")
sha256sums=("b2a8cf440451f406a62e3521cd9ce5ae9f0841d27c627144d1ca751d591af920")
noextract=("heroku-$pkgver.tgz")
options=('!strip')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" heroku-$pkgver.tgz
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/heroku/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

  # npm makes some directories world writable
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}

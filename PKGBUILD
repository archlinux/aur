# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=mjml
pkgname=nodejs-$_npmname
pkgver=5.4.0
pkgrel=1
pkgdesc="The only framework that makes responsive-email easy"
arch=(any)
url=https://mjml.io
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(
  https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
  https://raw.githubusercontent.com/mjmlio/mjml/v$pkgver/LICENSE.md
)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('80ac516552ae86528fae737586aff9c864fe1f02b87930e981e082249a8c2eff'
            '0c4f37a6b1d7fdc8e2abb11cf49ba9dfe8128a4242861930d810f01f00ca4c49')

package() {
  npm install --global \
    --cache "$srcdir/.npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:

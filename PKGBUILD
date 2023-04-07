# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>

pkgname=npkill
pkgver=0.11.1
pkgrel=1
pkgdesc="List any node_modules package dir in your system and how heavy they are. You can then select which ones you want to erase to free up space"
arch=('any')
url="https://github.com/voidcosmos/npkill"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-${pkgver//_/-}.tgz)
noextract=($pkgname-${pkgver//_/-}.tgz)
sha1sums=('dfb2236af6774c8699f1f86e8d3197d3c991b34d')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $pkgname@${pkgver//_/-}

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

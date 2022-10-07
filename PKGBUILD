# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Lucky <archlinux@builds.lucky.li>
# Contributor: carstene1ns <arch carsten-teibes de>

_gemname=nanoc
pkgname=ruby-$_gemname
pkgver=4.12.8
pkgrel=1
pkgdesc='A static-site generator with a focus on flexibility'
arch=('any')
url='https://nanoc.app'
license=('MIT')
depends=(
  'ruby'
  'ruby-addressable'
  'ruby-colored'
  'ruby-nanoc-checking'
  'ruby-nanoc-cli'
  'ruby-nanoc-core'
  'ruby-nanoc-deploying'
  'ruby-nanoc-external'
  'ruby-nanoc-live'
  'ruby-parallel'
  'ruby-tty-command'
  'ruby-tty-which'
)
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('65a0cbcd954f2a8d1cc50bfd2ed2f4395be7c536fda449e97a95be1a02de868725141aa95b35253c267f005f599ad130d63d3d30541305b69f2df02f047ed947')
b2sums=('3ba4c3a377b86e4704dcdbec121d0f6e8254b4894624f2f53f7f6990b520139dd37db2e4f3688e17da8a67ca140878b8b1ec6cadc5bbc68a463b27ced6611e18')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -vrf cache

  cd "gems/$_gemname-$pkgver"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:

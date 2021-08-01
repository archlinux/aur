# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-transaction
pkgname=ruby-$_gemname
pkgver=0.13.3
pkgrel=1
pkgdesc="Business Transaction Flow DSL"
arch=('any')
url="https://github.com/dry-rb/dry-transaction"
license=('MIT')
depends=(
  'ruby'
  'ruby-concurrent'
  'ruby-dry-container'
  'ruby-dry-events'
  'ruby-dry-matcher'
  'ruby-dry-monads'
)
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('ef716eb43839055212cc9ce8a3e294492ab58420dd03531dadc894c14f5a0b1af33085bf53583a787eb967d076cf491ad4514e1ee388304a094700da2c8caac2')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -vrf cache

  # delete unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  rm -vrf "$_gemname.gemspec"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=tzinfo-data
pkgname=ruby-$_gemname
pkgver=1.2021.5
pkgrel=1
pkgdesc='Timezone data for ruby-tzinfo'
arch=('x86_64')
url='https://github.com/tzinfo/tzinfo-data'
license=('MIT')
depends=('ruby' 'ruby-tzinfo')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('3a3ae86947fa7a674d5dfb4feb9cea4778e950374aab4d2e96bb23a4e2736979071176957373c5605bb50cb053ea35801532f22d9eeb147478388b445faf1bc0')
b2sums=('5f5814315af51d2a3cd835a50984b05f46239f03a7d1199970e3eb5f49130fbfc22f96aa930280181350a6d3a93bf39eda62046ff8853352f04ffc72429d4a2f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --verbose \
    --ignore-dependencies \
    --no-document \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -rf cache

  # delete unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  find . -type f -name ".*" -delete

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv *.md "$pkgdir/usr/share/doc/$pkgname"

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

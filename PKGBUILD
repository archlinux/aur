# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=tzinfo-data
pkgname=ruby-$_gemname
pkgver=1.2022.3
pkgrel=1
pkgdesc='Timezone data for ruby-tzinfo'
arch=('x86_64')
url='https://github.com/tzinfo/tzinfo-data'
license=('MIT')
depends=('ruby' 'ruby-tzinfo')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('9df00e7a16c3082f1cc3305681f5b50655c175fb6678704107780dbf64360b72f5fb0ef1a245f172bfb96e1e441816d4ee1ff0503e8b867b09cc1edc244cef4f')
b2sums=('5ff3e5a70f03a1ee6764ca7f11d398f50f440a99bbf146b26698403b7946bcaa368f8c28e15459f94bbafda8751aa5f720827d08704dce40fdb038d198dc9681')

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

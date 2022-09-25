# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=tzinfo-data
pkgname=ruby-$_gemname
pkgver=1.2022.4
pkgrel=1
pkgdesc='Timezone data for ruby-tzinfo'
arch=('x86_64')
url='https://github.com/tzinfo/tzinfo-data'
license=('MIT')
depends=('ruby' 'ruby-tzinfo')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('a84da22e953107f5a57c8b5333ee2e0105dc08f582bf8d74b70154921970709fa5f30a3ff02c2c9c6aa84f05a7db86cccc32918859f9c9fc2befc916cf048724')
b2sums=('fb4bb8ef07f600d0efbf190236cca7f04792e8fb2373537f2da1b7441890834306db4401a25d47cd9bea07252517f32357bd81db1ad5117a33fff5b01a5cc6aa')

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

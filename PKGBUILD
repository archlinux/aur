# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=serverengine
pkgname=ruby-$_gemname
pkgver=2.2.4
pkgrel=1
pkgdesc='A framework to implement robust multiprocess servers'
arch=('any')
url='https://github.com/treasure-data/serverengine'
license=('Apache')
depends=('ruby' 'ruby-sigdump')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('66e3b10c4396b4613b734d3d2764293de2935b0e99bc33c9ba0e79f69c2af6fbb53dee8e356ab351d65195124e139ec4b0aa7976594387432b88a3875e985ef9')

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
  rm -rf cache

  # delete unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  rm -rf .github .gitignore .rspec spec \
    Changelog Gemfile LICENSE Rakefile appveyor.yml

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv README.md examples "$pkgdir/usr/share/doc/$pkgname"

  # move license notice
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv NOTICE "$pkgdir/usr/share/licenses/$pkgname"
}


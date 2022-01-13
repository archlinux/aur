# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=serverengine
pkgname=ruby-$_gemname
pkgver=2.2.5
pkgrel=1
pkgdesc='A framework to implement robust multiprocess servers'
arch=('any')
url='https://github.com/treasure-data/serverengine'
license=('Apache')
depends=('ruby' 'ruby-sigdump')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('fb4abbf35553b8d69447be195a14018e335cbce0756b9ae91160bc4dc8253968a4b94c383f40aad1e1bd20aaeb700efced91341f3b26077a0d44b3dc00aa89c7')
b2sums=('a7b256c1029c38b35673d104f6aba118bc5644947db7feb185d57456af60baebafb3c6a74996998630b7a0dbe3ee0baa5d4f260538ca7a8abf542b7528cd7204')

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


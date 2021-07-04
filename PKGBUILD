# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ruby-jsonpath
_gemname=jsonpath
pkgver=1.1.0
pkgrel=1
pkgdesc='JSONPath implementation in Ruby'
arch=('any')
url='https://github.com/joshbuddy/jsonpath'
license=('MIT')
depends=('ruby' 'ruby-multi_json')
options=('!emptydirs')
source=("$_gemname-$pkgver.gem::https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$pkgname-$pkgver.gem")
b2sums=('1238376fad69a29b1975adcfef01569d7db9d4f1520360718ae4a6acbab06a70f9a2a2f7749e09125ad587442f0e9e7ce6c73ef40853a6ec90bdc8ace10df55f')

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
  find . -type f -name ".*" -delete
  rm -rf test

  # documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -v README.md "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -v LICENSE.md "$pkgdir/usr/share/licenses/$pkgname"
}

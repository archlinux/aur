# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ruby-jsonpath
_gemname="${pkgname#ruby-}"
pkgver=1.1.2
pkgrel=1
pkgdesc='JSONPath implementation in Ruby'
arch=('any')
url='https://github.com/joshbuddy/jsonpath'
license=('MIT')
depends=('ruby' 'ruby-multi_json')
options=('!emptydirs')
source=("$pkgname-$pkgver.gem::https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$pkgname-$pkgver.gem")
b2sums=('6efed16387fdd9704e9bdca22bbaee37931bf8827ea341aae57dd2bf00adc7db6213609fc80840ac8db332ee96ecdc589f445071a97bf7b58678068e8bc73537')

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

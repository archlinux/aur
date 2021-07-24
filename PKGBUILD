# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>

_gemname=mdl
pkgname=ruby-$_gemname
pkgver=0.11.0
pkgrel=1
pkgdesc="A lint tool to check markdown files and flag style issues"
arch=('any')
url="http://github.com/markdownlint/markdownlint"
license=('MIT')
depends=(
  'ruby'
  'ruby-kramdown'
  'ruby-kramdown-parser-gfm'
  'ruby-mixlib-cli'
  'ruby-mixlib-config'
  'ruby-mixlib-shellout'
)
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('b766757d86ece9dcb0f31cf28b5a8f8e6b6460fe94f14c0fef1c2cb803a159bb81034a9f0a86472859b4a695e91cacf59cb308daa14878ac9673bc873881b6df')

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

  # delete unnecessary files
  cd "gems/$_gemname-$pkgver"
  rm -vrf Gemfile mdl.gemspec

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}

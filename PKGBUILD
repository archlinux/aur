# Maintainer: Your Name <your.email@example.com>

gemname=rufus-scheduler
pkgname=ruby-rufus-scheduler
pkgver=3.9.1
pkgrel=3
pkgdesc="Job scheduler for Ruby (at, in, cron and every jobs)"
arch=('any')
url="https://github.com/jmettraux/rufus-scheduler"
license=('MIT')
depends=('ruby' 'ruby-fugit')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha256sums=('5fca077ca039a0025fa77fcc7484fa64e47a112124babc75d4c072ad05439992')

prepare() {
  if type rvm &>/dev/null; then rvm use system; fi
}

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${gemname}-${pkgver}.gem"
  rm "$pkgdir/$_gemdir/cache/${gemname}-${pkgver}.gem"
}


# Maintainer: Michal Kimle <kimle.michal@gmail.com>

_gemname=pifan
pkgname=$_gemname
pkgver=1.0.0
pkgrel=2
pkgdesc='Control your Raspberry Pi fan'
arch=(aarch64 armv6h armv7h)
url='https://gitlab/amarthadan/pifan'
license=(MIT)
depends=(ruby ruby-activesupport ruby-rpi_gpio ruby-tty-config ruby-tty-logger ruby-tty-option)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('8988aa986aed0b7e14de82f9934e438c1e4feaccc1854df5acf887dcf5980477')
backup=(etc/$_gemname/$_gemname.yml)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem install -N --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/config/$_gemname.yml" "$pkgdir/etc/$_gemname/$_gemname.yml"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/systemd/$_gemname.service" "$pkgdir/usr/lib/systemd/system/$_gemname.service"
}

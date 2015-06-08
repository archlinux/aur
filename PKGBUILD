# Maintainer: David Phillips <gmail, dbphillipsnz>

_gemname=spotify-to-mp3
pkgname=ruby-$_gemname
pkgver=0.6.1
pkgrel=1
pkgdesc="Ruby gem which enables downloading of MP3s from Spotify"
arch=(any)
url="https://github.com/frosas/spotify-to-mp3"
license=('GPL')
depends=(ruby ruby-colorize ruby-grooveshark ruby-json_pure ruby-rest-client)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('f631e8eff4ed28176619d6e59cda7c50b9aeb944047ecb8c6729f3e5656d24348d92c519a8c125abfe0566061e3024bdb5aa9acf57da3aa44164b415bec99a85')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

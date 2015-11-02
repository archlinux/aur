# Maintainer: kulpae <kulpae @ uraniumlane.net>

_gitname="cloudruby"
pkgname=$_gitname-git
pkgver=24.8082314
pkgrel=3
pkgdesc="Ncurses player for Soundcloud tracks in Ruby"
arch=(any)
url="https://github.com/kulpae/cloudruby"
license=(custom)
depends=('ruby' 'ruby-curses' 'ruby-httpclient' 'ruby-json_pure' 'mpg123')
optdepends=('ruby-gstreamer-3.0.7' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly')
makedepends=('git')
provides=('cloudruby')
conflicts=('cloudruby')
source=($_gitname::git://github.com/kulpae/cloudruby.git)
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$_gitname"
  install -dm 755 "${pkgdir}"/usr/{bin,lib/${_gitname}/{bin,lib},share/licenses/"${pkgname}"}/

  ln -s ../lib/${_gitname}/bin/cloudruby "${pkgdir}/usr/bin/cloudruby"

  install -m 755 bin/cloudruby         "${pkgdir}/usr/lib/${_gitname}/bin/"
  install -m 644 lib/cloudruby.rb      "${pkgdir}/usr/lib/${_gitname}/lib/"
  install -m 644 lib/mpg123player.rb   "${pkgdir}/usr/lib/${_gitname}/lib/"
  install -m 644 lib/gstplayer.rb      "${pkgdir}/usr/lib/${_gitname}/lib/"
  install -m 644 lib/ncurses_ui.rb     "${pkgdir}/usr/lib/${_gitname}/lib/"
  install -m 644 lib/soundcloud.rb     "${pkgdir}/usr/lib/${_gitname}/lib/"
  install -m 644 LICENSE               "${pkgdir}/usr/share/licenses/${pkgname}/"

  sed -i -- "s/require 'cloudruby'/require_relative '..\/lib\/cloudruby\/lib\/cloudruby'/g" "${pkgdir}/usr/bin/cloudruby"
}


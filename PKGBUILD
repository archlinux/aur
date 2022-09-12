# Maintainer: Anatol Pomozov

_gemname=gtk4
pkgname=ruby-$_gemname
pkgver=4.0.2
pkgrel=1
pkgdesc='Ruby/GTK4 is a Ruby binding of GTK+-4.x.'
arch=(x86_64)
url=https://ruby-gnome2.osdn.jp/
license=("LGPL-2.1+")
depends=(gobject-introspection gtk4 ruby ruby-atk ruby-gdk4)
makedepends=(ruby-native-package-installer ruby-glib2)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('b7164c534749ff9a5bc500d02e4b44704a0a7b5d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  local _platform="$(gem env platform | cut -d':' -f2)"
  local _extension_api_version="$(ruby -e'puts Gem.extension_api_version')"
  gem install --ignore-dependencies --no-document --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir"/usr/bin $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem" \
      ${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext/gtk3/*.o \
      "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext/gtk3/Makefile" \
      "${pkgdir}/${_gemdir}/extensions/${_platform}/${_extension_api_version}/${_gemname}-${pkgver}/gem_make.out" \
      "${pkgdir}/${_gemdir}/extensions/${_platform}/${_extension_api_version}/${_gemname}-${pkgver}/mkmf.log"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING.LIB" "$pkgdir/usr/share/licenses/$pkgname/COPYING.LIB"
}

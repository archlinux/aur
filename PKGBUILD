# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname=cairo-gobject
pkgname=ruby-$_gemname
pkgver=4.0.6
pkgrel=1
pkgdesc='Ruby/CairoGObject is a Ruby binding of cairo-gobject'
arch=(x86_64)
url='http://ruby-gnome2.sourceforge.jp/'
license=(LGPL2.1)
depends=(ruby ruby-cairo ruby-glib2=$pkgver)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('3a54d66868079aeed0f53b9a2b08479b0e92384ae4a210e8f62e2eee2372f840')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  local _platform="$(gem env platform | cut -d':' -f2)"
  local _extension_api_version="$(ruby -e'puts Gem.extension_api_version')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem" \
      "${pkgdir}/${_gemdir}/extensions/${_platform}/${_extension_api_version}/${_gemname}-${pkgver}/gem_make.out" \
      "${pkgdir}/${_gemdir}/extensions/${_platform}/${_extension_api_version}/${_gemname}-${pkgver}/mkmf.log" \
      "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext/cairo-gobject/rb-cairo-gobject.o" \
      "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext/cairo-gobject/Makefile"
}

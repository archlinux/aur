# Maintainer: Bertrand Bonnefoy-Claudet <bertrandbc@gmail.com>
# Contributor: Brice Waegeneire <brice dot wge at gmail dot com>

_gemname=veewee
pkgname=ruby-$_gemname
pkgver=0.4.5.1
pkgrel=1
pkgdesc="A tool for building custom Vagrant base boxes and virtual machine images."
arch=(any)
url="https://github.com/jedi4ever/veewee"
license=('MIT')
depends=('ruby' 'ruby-ansi-1.3' 'ruby-childprocess'
         'ruby-fission' 'ruby-fog>=1.8' 'ruby-grit' 'ruby-highline'
         'ruby-json' 'ruby-mime-types-1>=1.16' 'ruby-i18n'
         'ruby-net-ssh>=2.2.0' 'ruby-os>=0.9.6' 'ruby-popen4>=0.1.2'
         'ruby-progressbar' 'ruby-ruby-vnc-1.0' 'ruby-ruby-vnc>=1.0.0'
         'ruby-thor>=0.15' 'ruby-to_slug')
provides=('veewee')
conflicts=('veewee')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('06e4bdca3d8efc92677662329a1efa047c6e0cf777721dcaaffe2a437f4b4ad523bca93cdbaf2f6f21fa95f56896e69d449b3ab86d1152b15efa517192564ac8')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
   -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  install -Dm644 $(find "${pkgdir}" -name License) \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=winrm
pkgname=ruby-$_gemname
pkgver=1.3.6
pkgrel=2
pkgdesc='Ruby library for Windows Remote Management'
arch=(any)
url='https://github.com/WinRb/WinRM'
license=(Apache-2.0)
depends=('ruby' 'ruby-builder>=2.1.2' 'ruby-gssapi>1.2' 'ruby-gyoku>1.0' 'ruby-httpclient>=2.2' 'ruby-logging>=1.6.1' 'ruby-nori>=2.0' 'ruby-rubyntlm_0.4.0' 'ruby-uuidtools>=2.1.2')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('09459103f566b353eebeee64a7258e63573eb91f638cc1ac22c269e2c7d839ba209e8520d55235bbf786c1c0d4fd969f5a09090055823f9e025230ed4adeb388')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

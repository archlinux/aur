# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=winrm
pkgname=ruby-$_gemname
pkgver=2.1.2
pkgrel=1
pkgdesc='Ruby library for Windows Remote Management'
arch=(any)
url='https://github.com/WinRb/WinRM'
license=(Apache-2.0)
depends=('ruby' 'ruby-builder>=2.1.2' 'ruby-erubis=2.7' 'ruby-gssapi>1.2' 'ruby-gyoku>1.0' 'ruby-httpclient>=2.2' 'ruby-logging>=1.6.1' 'ruby-nori>=2.0' 'ruby-rubyntlm_0.4.0')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('235145a0661f745612a362c29d279ed82e5c4e68cd6d758684a9fb1bc9384dc1e6600b120aff8f2fd1dc525ba677ea9aa163e1433dcf55021c0c1a577989a234')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

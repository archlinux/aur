# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=http-form_data
pkgname=ruby-$_gemname
pkgver=2.3.0
pkgrel=1
pkgdesc='Utility-belt to build form data request bodies'
arch=('any')
url="https://github.com/httprb/form_data"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('faa29c86d57fac1554680bb10e1a71e591ec873a04c63c0d0fa2c993c03df03dd35f3b762a290d188285efc0cf63d5040b262d386cdf7a4abc4b7477a6a1e00f')

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

  # delete unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  find . -type f -name ".*" -delete
  rm -vf appveyor.yml

  # documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -v CHANGES.md README.md "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -v LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
}

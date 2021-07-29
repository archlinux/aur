# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Jeremy Audet <jerebear@protonmail.com>
# Contributor: carlf <carlf at photocarl dot org>
# Contributor: oslik <oslik at mail dot ru>

_gemname=adsf
pkgname=ruby-$_gemname
pkgver=1.4.6
pkgrel=1
pkgdesc="A web server that you can launch instantly in any directory"
arch=('any')
url='https://github.com/ddfreyne/adsf'
license=('MIT')
depends=('ruby' 'ruby-rack')
options=('!emptydirs')
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  "https://raw.githubusercontent.com/ddfreyne/adsf/da657ef0926101ff941e2b8e665a0eb296993b51/LICENSE"
)
noextract=("$_gemname-$pkgver.gem")
b2sums=('c2492a8e53f8fb51aff7c6327b54386b3de1feb8fa0e1f3ff477db113ae7e31730de269e180d53fc9a331b22469fbc023608f912a609313f073f47dde120591d'
        '40aaf8ba18519a33d8bc34146b4da9d26a32d0739b1399d1d20463207c09604125804e89b85cf8fde1bbe35aca66956c1cd0c303a05d8873436fc3a8462f02df')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -vrf cache

  cd "gems/$_gemname-$pkgver"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md
}

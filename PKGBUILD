# Maintainer: lmartinez-mirror
pkgname=fish-abbreviation-tips-git
_pkgname=${pkgname%-git}
pkgver=0.5.1.r33.g71662df
pkgrel=1
pkgdesc="Alias abbreviation tips for fish shell"
arch=('any')
url="https://github.com/gazorby/fish-abbreviation-tips"
license=('MIT')
groups=('fish-plugins')
depends=('fish')
makedepends=('git')
checkdepends=('fish-fishtape')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

check() {
  cd "$_pkgname"
  fish -Pc "fishtape test/fish-abbreviation-tips.fish"
}

package() {
  cd "$_pkgname"
  install -Dm644 conf.d/abbr_tips.fish "$pkgdir/etc/fish/conf.d/abbr_tips.fish"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find functions -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/fish/{}" \;
}


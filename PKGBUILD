# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=rmail-sup
pkgname=ruby-$_gemname
pkgver=1.0.1
pkgrel=1
pkgdesc="RMail is a lightweight mail library containing various utility classes and modules that allow ruby scripts to parse, modify, and generate MIME mail messages."
arch=(any)
url="https://rubygems.org/gems/rmail-sup"
license=('unknown')
depends=(ruby)
conflicts=(ruby-rmail)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('2f61911c2aa30284c7e2ed3d7bb594a7cb8d20a67774a570a7c0141d40985cf7')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -r rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

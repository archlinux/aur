# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=sup
pkgname=sup
pkgver=1.0
pkgrel=1
pkgdesc="Sup is a console-based email client for people with a lot of email. Great mutt alternative."
arch=(any)
url="http://sup-heliotrope.github.io/"
license=('GPL')
depends=('ruby-chronic-old' 'ruby-highline' 'ruby-locale' 'ruby-lockfile' 'ruby-mime-types' 'ruby-ncursesw' 'ruby-rmail-sup' 'ruby-trollop' 'ruby-unicode' 'ruby-xapian-ruby')
optdepends=('ruby-gpgme: PGP support')
conflicts=(sup-git)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('3297c3ef21019e8cfd6e5ca28b1964e8')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:

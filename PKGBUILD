# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=sup
pkgname=sup
pkgver=0.22.1
pkgrel=1
pkgdesc="Sup is a console-based email client for people with a lot of email. Great mutt alternative."
arch=(any)
url="http://supmua.org/"
license=('GPL')
depends=('ruby-chronic-old' 'ruby-highline' 'ruby-locale' 'ruby-lockfile' 'ruby-mime-types-1' 'ruby-ncursesw' 'ruby-rmail-sup' 'ruby-trollop' 'ruby-unicode' 'ruby-xapian-ruby')
optdepends=('ruby-gpgme: PGP support')
conflicts=(sup-git)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('f1b1af9e6617a3ce076ffd7419c3d5c325ee46d9e299fc60fb86b8aa63d7429f')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: pisuka <tekmon@gmail.com>

pkgname=heroku-toolbelt
pkgver=3.40.5
pkgrel=1
pkgdesc="Everything you need to get started using Heroku (including foreman)"
arch=('any')
url="https://toolbelt.heroku.com"
license=('MIT' 'APACHE' 'RUBY' 'PerlArtistic' 'GPL' 'custom')
depends=("ruby>=1.9")
makedepends=("ruby-bundler")
optdepends=('git')
conflicts=('ruby-heroku' 'ruby-foreman' 'heroku-client')
source=('Gemfile' 'Gemfile.lock')
sha256sums=('7238bb49d905f8b2a201b7b780892a3629b145bcc679ef74a1af5dc1053b210a'
            '69a01fe24de67c23da7ac5394557742aea2e49ae0cca4311c297be2ba171c917')

package() {
  cd "$pkgdir"
  mkdir -p "usr/lib/ruby/vendor_ruby/$pkgname" "usr/bin" "usr/share/man/man1"
  cd "usr/lib/ruby/vendor_ruby/$pkgname"

  cp -L "$srcdir"/Gemfile* .

  bundle install --standalone --deployment --binstubs="$pkgdir/usr/bin"

  cd "$pkgdir"

  find "usr/bin" -type f ! -name heroku ! -name foreman -execdir rm "{}" +

  find "usr/lib/ruby/vendor_ruby/heroku-toolbelt/vendor/bundle/ruby" -path "*/gems/*/man/*" -exec ln -st "usr/share/man/man1/" "/{}" \;
}

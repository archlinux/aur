# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: pisuka <tekmon@gmail.com>

pkgname=heroku-toolbelt
pkgver=3.41.3
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
sha256sums=('d013869613a830805c25922e85233446e5dc672f82c397634012ec7a3eb6e3ce'
            'ab99e9f25eaf6fb311070083e7a4bf38de572372f7784ab0871a74dc62d93ec7')

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

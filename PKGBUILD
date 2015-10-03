# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: pisuka <tekmon@gmail.com>

pkgname=heroku-toolbelt
pkgver=3.42.15
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
sha256sums=('f94136836e8f2808bcd2c12cb9d58a4ea42679a05b41e6231efe6475140010f7'
            '2204a52cd1fc2abfdc8520ed17592184d495125fda66ef0caaef01d689839ba6')

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

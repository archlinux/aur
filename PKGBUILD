# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: pisuka <tekmon@gmail.com>

pkgname=heroku-toolbelt
pkgver=3.40.10
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
sha256sums=('93feb332bd7a187de01dc7d1620d85663e24b5f2e1344c3e22d3af5ba261d695'
            'a225c79e3bb32159484918c3b6f4220986985e5d50f07a38edd210b56ec8ce11')

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

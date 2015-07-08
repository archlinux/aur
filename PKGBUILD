# Maintainer: pisuka <tekmon@gmail.com>
pkgname=heroku-toolbelt
pkgver=3.36.5
pkgrel=1
pkgdesc="Everything you need to get started using Heroku (including foreman)"
arch=(any)
url="https://toolbelt.heroku.com"
license=(MIT APACHE RUBY PerlArtistic GPL custom)
groups=()
depends=("ruby>=1.9")
makedepends=("ruby-bundler")
optdepends=(git)
provides=()
conflicts=(ruby-heroku ruby-foreman heroku-client)
replaces=()
backup=()
options=()
install=
source=(Gemfile Gemfile.lock)
md5sums=(0a2cce437aeb5097696a6f78cc4c3bb5 31cf02779f22ac6dc8e1fa894abbccd2)

package() {
	cd "$pkgdir"
	mkdir -p "usr/lib/ruby/vendor_ruby/$pkgname" "usr/bin" "usr/share/man/man1"
	cd "usr/lib/ruby/vendor_ruby/$pkgname"

	#cp -R "$srcdir/heroku-client" .
	cp -L "$srcdir"/Gemfile* .

	#find "heroku-client/bin" -maxdepth 1 -type f -executable -printf "/usr/lib/ruby/vendor_ruby/$pkgname/heroku-client/bin/%f\n" | xargs ln -st "$pkgdir/usr/bin/"

	bundle install --standalone --deployment --binstubs="$pkgdir/usr/bin"

	cd "$pkgdir"

	find "usr/bin" -type f ! -name heroku ! -name foreman -execdir rm "{}" +

	find "usr/lib/ruby/vendor_ruby/heroku-toolbelt/vendor/bundle/ruby" -path "*/gems/*/man/*" -exec ln -st "usr/share/man/man1/" "/{}" \;
}

# vim:set ts=2 sw=2 et:

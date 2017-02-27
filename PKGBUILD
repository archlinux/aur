# Maintainer: Grey Christoforo <grey@christoforo.net>

_gemname=gollum
pkgname=ruby-$_gemname
pkgver=4.0.1
pkgrel=2
pkgdesc='A simple, Git-powered wiki.'
arch=(any)
url='http://github.com/gollum/gollum'
license=(MIT)
depends=(ruby ruby-gollum-lib ruby-kramdown ruby-sinatra ruby-mustache ruby-useragent)
options=(!emptydirs)
source=(
  https://rubygems.org/downloads/$_gemname-$pkgver.gem
  https://rubygems.org/downloads/gollum-grit_adapter-1.0.0.gem
  https://rubygems.org/downloads/rouge-2.0.0.gem
  https://rubygems.org/downloads/nokogiri-1.6.4.gem
  https://rubygems.org/downloads/mini_portile-0.6.2.gem
  https://rubygems.org/downloads/sanitize-2.1.0.gem
  https://rubygems.org/downloads/gemojione-2.2.0.gem
  https://rubygems.org/downloads/kramdown-1.8.0.gem
  https://rubygems.org/downloads/rack-1.5.5.gem
  https://rubygems.org/downloads/mustache-0.99.8.gem
)
noextract=(
  $_gemname-$pkgver.gem
  gollum-grit_adapter-1.0.0.gem
  rouge-2.0.0.gem
  nokogiri-1.6.4.gem
  mini_portile-0.6.2.gem
  sanitize-2.1.0.gem
  gemojione-2.2.0.gem
  kramdown-1.8.0.gem
  rack-1.5.5.gem
  mustache-0.99.8.gem
)
sha1sums=('803f054a60fd7b0caf5094e60284cc90711d779c'
          '98b4cac14299e436bfbf8930abfc1aaa0c6a28f8'
          '5ff01d1f31c7c801fa3de63b4f55702720650621'
          '73262bed5fc28c1046230c6e6af67d30aeee3cbc'
          '696b940eb4ff8076a2080684046da1d2b10f41b8'
          '677537fc6c11dd674808fb9ab75a987ea563d253'
          '77077db1c3656acc19accde30c8fd2939c5c5bcb'
          '1bb4eccd2fcf1b51c3aa7b9611da5ee1a5b6899c'
          'ba068a3f5dbbed9ed38fdb54307698b5afa39a18'
          '0baaada539b2dcb5175bcdac186f407228acce7c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" gollum-grit_adapter-1.0.0.gem
  gem install --no-document --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" rouge-2.0.0.gem
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" mini_portile-0.6.2.gem
  GEM_PATH="$pkgdir/$_gemdir":$GEMPATH gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" nokogiri-1.6.4.gem
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" sanitize-2.1.0.gem
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" gemojione-2.2.0.gem
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" kramdown-1.8.0.gem
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" rack-1.5.5.gem
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" mustache-0.99.8.gem

  # prevent conflicts in /usr/bin
  _bins="${pkgdir}"/usr/bin/*
  for f in $_bins
  do
	  if [[ -f /usr/bin/$(basename $f) && ( $(basename $f) != gollum ) ]]; then
      rm "$f"
    fi
  done

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

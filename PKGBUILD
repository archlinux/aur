# Maintainer  : Fernando "Firef0x" G.P. da Silva <firefgx { aT ) gmail [ d0t } com>
# Contributor : Fernando "Firef0x" G.P. da Silva <firefgx { aT ) gmail [ d0t } com>

pkgname=ruby-zoom
pkgver=3.3.0
pkgrel=1
pkgdesc="Quickly open CLI search results in your favorite editor"
arch=('any')
url='http://mjwhitta.github.io/zoom/'
license=('GPL3')
depends=('findutils' 'ruby' 'ruby-scoobydoo' 'sed')
optdepends=('ack: as search backend'
            'grep: as search backend'
            'the_platinum_searcher: as search backend'
            'the_silver_searcher: as search backend'
            'vim: for opening search result in default editor')
provides=('zoom-git')
conflicts=('zoom-git')
replaces=('zoom-git')

source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem"
        "https://gitlab.com/mjwhitta/zoom/raw/master/completions/_z"
        "https://gitlab.com/mjwhitta/zoom/raw/master/README.md")
noextract=("$pkgname-$pkgver.gem")
sha256sums=('f99305cc8a4f298aff628eb7541894e5adcc11a4411b86712e089340eb602a21'
            'SKIP'
            'SKIP')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"

  # Install Z Shell completion script
  install -Dm644 _z "${pkgdir}/usr/share/zsh/site-functions/_z"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set sts=2 sw=2 ts=2 et:

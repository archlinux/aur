# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=ruby-github-markup
_gemname=${pkgname#ruby-}
pkgver=5.0.1
pkgrel=1
pkgdesc='The code GitHub uses to render README.markup'
arch=('any')
url='https://github.com/github/markup'
license=('MIT')
depends=('ruby' 'ruby-rdoc')
optdepends=('ruby-redcarpet: HTML'
            'ruby-redcloth: Textile'
            'asciidoctor: AsciiDoc')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('883bbab48de7a9612829f5c0a88f5d0ca6b3214c496bd09d2dfdbaf4ec8acf18a1a55b0b70dff1963a703de9a4bec7d0d9c2554e2615e4d287d496844b22f309')

package() {
  _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/test"
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/script"
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/"{.dockerignore,.github/,.gitignore,.kick}
  rm "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/"{CODE_OF_CONDUCT.md,CONTRIBUTING.md,Dockerfile,Rakefile}

  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete

  install -Dm 644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


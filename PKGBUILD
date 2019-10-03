# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=rabid
pkgver=0.0.4
pkgrel=1
pkgdesc='A CLI tool and library allowing to simply decode all kind of BigIP cookies.'
arch=('any')
url='https://orange-cyberdefense.github.io/rabid/'
license=('MIT')
depends=('ruby' 'ruby-bundler' 'libxslt')
conflicts=('rabid-git')
provides=('rabid')
source=("https://github.com/Orange-Cyberdefense/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('dde0f3997bbe35877629b771343806b1f4daffaafe4b4e8e750ef7868cb5e70342532aae0b17d232febc01f790e4b2d9d994815d13d0dc2d7c3910c9920952e7')
install="$pkgname.install"

package() {
  cd "$pkgname-$pkgver"

  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/$pkgname"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cp -a docs/* "$pkgdir/usr/share/doc/$pkgname/"

  rm -rf *.md LICENSE.txt docs

  cp -a * "$pkgdir/usr/share/$pkgname/"
  cp -a .gitignore .rubocop.yml .yardopts .yardopts-dev "$pkgdir/usr/share/$pkgname/"

  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
cd /usr/share/$pkgname
exec bundle exec ./bin/$pkgname "\$@"
EOF

  chmod a+x "$pkgdir/usr/bin/$pkgname"

  cat > "$pkgdir/usr/bin/$pkgname-console" << EOF
#!/bin/sh
cd /usr/share/$pkgname
exec bundle exec ./bin/${pkgname}_console "\$@"
EOF

  chmod a+x "$pkgdir/usr/bin/$pkgname-console"
}


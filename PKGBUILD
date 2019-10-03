# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=rabid
pkgver=0.0.3
pkgrel=1
pkgdesc='A CLI tool and library allowing to simply decode all kind of BigIP cookies.'
arch=('any')
url='https://orange-cyberdefense.github.io/rabid/'
license=('MIT')
depends=('ruby' 'ruby-bundler' 'libxslt')
conflicts=('rabid-git')
provides=('rabid')
source=("https://github.com/Orange-Cyberdefense/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('e33c4c9713643fed9c81ff287b3befd826af3b52b7af714c6ac3a92cec937029ae806d49ab6ca47111ebb8b6a4522e7c11e838053e6a041de3aae902a7e409f5')
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


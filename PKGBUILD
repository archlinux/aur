# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=rabid
pkgver=0.0.5
pkgrel=1
pkgdesc='A CLI tool and library allowing to simply decode all kind of BigIP cookies.'
arch=('any')
url='https://orange-cyberdefense.github.io/rabid/'
license=('MIT')
depends=('ruby' 'ruby-bundler' 'libxslt')
conflicts=('rabid-git')
provides=('rabid')
source=("https://github.com/Orange-Cyberdefense/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('3ff94abff0e15ca3a3053434955f5b7ce70d9db01e2288e87e940f0d95cb3fe1c3dd61988abd14e6ebf74853f8e6e95af42e3a5f6478a3be082de61e991ea64f')
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


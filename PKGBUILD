# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=haiti
pkgver=0.0.1
pkgrel=1
pkgdesc='A CLI tool to identify the hash type of a given hash.'
arch=('any')
url='https://orange-cyberdefense.github.io/haiti/'
license=('MIT')
depends=('ruby' 'ruby-bundler' 'libxslt')
conflicts=('haiti-git')
provides=('haiti')
source=("https://github.com/Orange-Cyberdefense/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('d91cad845d36f3dc1f877ecc789fe9d86a06939d5941b0927c303b67bb5dcc28780004cab98b8fccfde496afb74ef4d5cd28cb86132f3fd385df3c838c70320e')
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
  cp -a .gitignore .editorconfig .rubocop.yml .yardopts .yardopts-dev "$pkgdir/usr/share/$pkgname/"

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

# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=aspisec
pkgver=0.1.0
pkgrel=3
pkgdesc='Removes the traces left by offensive security tools.'
arch=('any')
url='https://noraj.github.io/aspisec/'
license=('MIT')
depends=('ruby' 'ruby-bundler')
source=("https://github.com/noraj/$pkgname/archive/refs/tags/$pkgver.tar.gz")
b2sums=('aa31f3a6f2cce047d3de1e5a34be8c8b606241f8f5a9bf127193c5405a7e416232684db07d0ce6e772da1449cb23236564f2a8cf0d5f53fb0772ff864345d79a')
install="$pkgname.install"

package() {
  cd "$pkgname-$pkgver"

  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/$pkgname"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
  cp -rT --no-preserve=ownership --preserve=all --no-dereference docs/ "$pkgdir/usr/share/doc/$pkgname"

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -rf docs/ docs-tools/ *.md LICENSE .*

  cp --no-preserve=ownership -a * "$pkgdir/usr/share/$pkgname/"

  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
cd /usr/share/$pkgname
bundle exec ruby bin-ruby/$pkgname "\$@"
EOF

  chmod +x "$pkgdir"/usr/bin/*
}

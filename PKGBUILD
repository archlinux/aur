# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=unisec
_gemname=$pkgname
pkgver=0.0.8
pkgrel=1
pkgdesc='Unicode Security Toolkit.'
arch=('any')
url='https://noraj.github.io/unisec'
license=('MIT')
depends=('ruby')
makedepends=('git' 'ruby-bundler')
source=("https://github.com/noraj/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('b931d6a6c9a63de77ac7caded9a00845f32e33cf06ee971248956d5d2b794f9b6712f079cbdf44aec9df553412a928644535830e65da96dd4d70a7079eefde40')
install="$pkgname.install"

package() {
  cd "$pkgname-$pkgver"

  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/$pkgname"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
  cp -rT --no-preserve=ownership --preserve=all --no-dereference docs/ "$pkgdir/usr/share/doc/$pkgname"

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -rf docs/ *.md LICENSE .github/ docs-tools/ test/ .* Rakefile

  cp --no-preserve=ownership -a * "$pkgdir/usr/share/$pkgname/"

  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
cd /usr/share/$pkgname
bundle exec ruby bin/$pkgname "\$@"
EOF

  chmod +x "$pkgdir"/usr/bin/*
}


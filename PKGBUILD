# Maintainer: Mark Kiraly <mark.kiraly.hu@gmail.com>
pkgname=libgendesktop
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple Electron GUI for Library Genesis with extra features."
arch=('any')
url="https://github.com/ProgrammerGnome/libgendesktop"
license=('MIT')
depends=('electron35' 'nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ProgrammerGnome/libgendesktop/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('779a9bcd8e35f970e502785a7f1158ee5444679c2c4a7844d99728065e021d66')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install --omit=dev
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/opt/$pkgname"
  cp -r . "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/bash
exec /usr/bin/electron35 /opt/$pkgname "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"
}


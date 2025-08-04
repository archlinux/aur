# Maintainer: XielQ <offical.gamerboytr@yandex.com>
pkgname=bombkurdistan-bin
pkgver=1.0.11
pkgrel=3
pkgdesc='A simple game where you can bomb kurdistan'
arch=('x86_64')
url='https://github.com/XielQs/BombKurdistan'
license=('MIT')
makedepends=('make' 'gcc' 'cmake')
provides=('bombkurdistan')
conflicts=('bombkurdistan' 'bombkurdistan-git')
replaces=('bombkurdistan-git')
source=("${url}/releases/download/v${pkgver}/bombkurdistan_linux.zip")
sha256sums=('4ca576434639833cc5601360c3ff081b8aafabc36613d62061ac54d77f889544')

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/lib/$pkgname"
  install -Dm755 bombkurdistan "$pkgdir/usr/lib/$pkgname/bombkurdistan"
  cp -r assets "$pkgdir/usr/lib/$pkgname/assets"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/bombkurdistan.desktop" <<EOF
[Desktop Entry]
Name=BombKurdistan
Comment=A simple game where you bomb kurdistan
Exec=/usr/bin/bombkurdistan
Icon=bombkurdistan
Terminal=false
Type=Application
Categories=Game;
EOF

  install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/bombkurdistan.png"

  install -d "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/bombkurdistan" <<EOF
#!/bin/bash
cd /usr/lib/$pkgname
./bombkurdistan
EOF
  chmod +x "$pkgdir/usr/bin/bombkurdistan"
}

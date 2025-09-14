# Maintainer: XielQ <offical.gamerboytr@yandex.com>
pkgname=bombkurdistan-bin
pkgver=1.2.3
pkgrel=1
pkgdesc='A simple game where you can bomb kurdistan'
arch=('x86_64')
url='https://github.com/XielQs/BombKurdistan'
license=('MIT')
makedepends=('make' 'gcc' 'cmake')
provides=('bombkurdistan')
conflicts=('bombkurdistan' 'bombkurdistan-git')
replaces=('bombkurdistan-git')
source=("${url}/releases/download/v${pkgver}/bombkurdistan_linux.zip")
sha256sums=('17866cb93e6bbc229fdfa315c30d636929f0aca7d9b4c24a07af3387235d5331')

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

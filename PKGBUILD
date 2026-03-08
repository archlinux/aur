# Maintainer: kitic
pkgname=salwyrr
pkgver=4
pkgrel=1
pkgdesc='Minecraft launcher with built-in client features, mod support and PvP optimizations'
arch=('any')
url='https://salwyrr.com'
license=('custom:unknown')
depends=('java-environment')

source=("salwyrr.jar::https://salwyrr.com/$pkgver/Salwyrr%20Minecraft%20Launcher%20$pkgver.jar"
        "salwyrr.png::https://www.salwyrr.com/img/salwyrrclient/min.png")

sha512sums=('130337c5738e9cee84dff629c5d4a34f9b2bbf587e7b0eaa518075a76a8086854e7604c9ae23455eca239fbbf36c3c1472b477d306a347a1dba9b1c63c61ee3d'
            'fbfb75ee33d31cee6bc547e2654164ba053947574e5bd3bf7ce2606dea32a89c82d76bf7c77ff8d9a7f2370da5b1fcf79775b23d12b5198541543538e87dfcfa')

package() {
  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/$pkgname"
  install -dm 755 "$pkgdir/usr/share/pixmaps"
  install -dm 755 "$pkgdir/usr/share/applications"

  install -Dm 644 "salwyrr.jar" "$pkgdir/usr/share/$pkgname/salwyrr.jar"
  install -Dm 644 "salwyrr.png" "$pkgdir/usr/share/pixmaps/salwyrr.png"

  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec java -jar /usr/share/$pkgname/salwyrr.jar "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"

  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Salwyrr
Exec=$pkgname
Icon=salwyrr
Type=Application
StartupNotify=true
Categories=Game;
EOF
}

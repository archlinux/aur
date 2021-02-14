# Maintainer: Tom Wadley <tom@tomwadley.net>
pkgname=gdx-skin-composer
pkgver=43
pkgrel=1
pkgdesc="Create skins for LibGDX scene2d.ui with a graphical interface"
arch=('any')
url="https://github.com/raeleus/skin-composer"
license=('MIT')
depends=('java-runtime>=11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/raeleus/skin-composer/releases/download/$pkgver/skin-composer-linux.tar.gz"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/raeleus/skin-composer/$pkgver/LICENSE")
sha256sums=('7668f787d39709d6b7ad8bdd55193bb7b31f2f12235e5b699a1f19d43468242a'
            '2c3616ce4f347fcb73d94f27aa5a5e37ecbf5c8511ea993a2a2ad2c89daa8a3e')

prepare() {
    cat <<EOF > $pkgname
#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/$pkgname/$pkgname.jar' "\$@"
EOF

    cat <<EOF > $pkgname.desktop
[Desktop Entry]
Type=Application
Name=Skin Composer
Comment=$pkgdesc
Exec=/usr/bin/$pkgname
Icon=$pkgname
Categories=Development;
EOF
}

package() {
  install -Dm 755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 $pkgname-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm 644 lib/app/SkinComposer.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm 644 lib/SkinComposer.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# Maintainer: Tom Wadley <tom@tomwadley.net>
pkgname=gdx-skin-composer
pkgver=45
pkgrel=1
pkgdesc="Create skins for LibGDX scene2d.ui with a graphical interface"
arch=('any')
url="https://github.com/raeleus/skin-composer"
license=('MIT')
depends=('java-runtime>=11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/raeleus/skin-composer/releases/download/$pkgver/skin-composer-linux.tar.gz"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/raeleus/skin-composer/$pkgver/LICENSE")
sha256sums=('75c7e6fb11642fe1253e249212fc5709bfc0cc99f46eee7eeb553d24f86c0063'
            'fe1238180e16b079e64e39b5a22de7ef4a8a5eaff1e144718baa7ca6b59bf461')

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

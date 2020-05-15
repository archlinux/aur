# Maintainer: Tom Wadley <tom@tomwadley.net>
pkgname=gdx-skin-composer
pkgver=34
pkgrel=1
pkgdesc="Create skins for LibGDX scene2d.ui with a graphical interface"
arch=('any')
url="https://github.com/raeleus/skin-composer"
license=('MIT')
depends=('java-runtime')
source=("$pkgname-$pkgver.zip::https://github.com/raeleus/skin-composer/releases/download/$pkgver/skin-composer-linux.zip"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/raeleus/skin-composer/$pkgver/LICENSE")
sha256sums=('94bec1d8513aa6eb180612201704a66651867bd86c53e9a0bedd8d9071a151e6'
            '65692928853a587a07bafe89d2449e1cf0f28dcc3fd2b0c4116a646ef63d7bcd')

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
  install -Dm 644 app/SkinComposer.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm 644 bin/SkinComposer.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

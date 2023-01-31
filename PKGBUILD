# Maintainer: Tom Wadley <tom@tomwadley.net>
pkgname=gdx-skin-composer
pkgver=55.a
pkgrel=1
pkgdesc="Create skins for LibGDX's Scene2D.UI"
arch=('any')
url="https://github.com/raeleus/skin-composer"
license=('MIT')
depends=('java-runtime>=11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/raeleus/skin-composer/releases/download/${pkgver/./}/skin-composer-linux.tar.gz"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/raeleus/skin-composer/${pkgver/./}/LICENSE")
sha256sums=('0f86d5ca1a25c32704117ad8688fbdf18b965ab44c59b607c816d3da15902281'
            '6045b9948f5cdd11712c42bb86fe4d413a579e52db8eba6cea39df818bb876fc')

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

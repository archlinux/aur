# former Maintainer: si_kabayan <aaizap4p at gmail dot com>
pkgname=raccoon
pkgver=4.0.1
pkgrel=1
arch=('any')
pkgdesc="Alternative Google Play (with GUI) client to download Android APK files to your computer"
url="http://www.onyxbits.de/raccoon"
license=('Apache')
depends=('java-environment')
install=raccoon.install
source=('raccoon.desktop'
        'https://github.com/onyxbits/Raccoon/raw/master/artwork/icon.svg'
        "http://raccoon.onyxbits.de/sites/raccoon.onyxbits.de/files/raccoon-$pkgver.jar"
        "raccoon.install")
noextract=('${pkgname}-${pkgver}.jar')
sha512sums=('99ae7ab9aa77f6de0779c9179e16dbccd36362adc710cd5d7289c473b6aff62d39a0e29be63840bc7f614e360d17b51f877ff2bf2fda938da8fa13e3f9248647'
            'f63e94b86f5b111b8833d53767b0f6eada48426e1b0e30df0137bed455c80ec37087f656e2f0cac9386f4d25441686df82c988252120fc335028d2885b8653f6'
            'a2db3f9678a946200ebe37e8c5aad1e1746a397f3f826492c7146843e5ecaab145ef8eb1707b121dc1fb2dd742404ba4742d3cffa5d3de0ee7980200dc7fc8be'
            '0e095c7cb167fd049968ba9e7c5acf51c3454aca884fd3106209d9ba92cd434c22c1398996f58238e98c692d7b0a635c6e6fb60782ba0dcb79cd837fe9ed7bba')

package() {
  # install files to java shared dir
  mkdir -p "$pkgdir/usr/share/java/$pkgname"
  install -Dm644 ${pkgname}-${pkgver}.jar "$pkgdir/usr/share/java/$pkgname"

  # install icon and desktop database entry
  install -Dm644 icon.svg "$pkgdir/usr/share/pixmaps/raccoon.svg"
  install -Dm644 raccoon.desktop  "$pkgdir/usr/share/applications/raccoon.desktop"

  # starter
  mkdir -p "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/raccoon" << \here
#!/bin/sh
exec java -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Draccoon.home="$HOME/.Raccoon" -jar /usr/share/java/raccoon/raccoon-pkgver.jar "$@"
exit $?
here
    sed -i "s/pkgver/$pkgver/" "$pkgdir/usr/bin/raccoon"
    chmod a+x "$pkgdir/usr/bin/raccoon"
}


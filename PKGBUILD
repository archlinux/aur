pkgname=captvty
pkgver=2.3.10.2
pkgrel=1
pkgdesc='Access to the live and shows provided by various french TV channels'
arch=('i686' 'x86_64')
url='http://www.captvty.fr'
license=('custom')
depends=('winetricks' 'wine-mono' 'libjpeg6-turbo')
depends_x86_64=('lib32-libjpeg6-turbo')
makedepends=('imagemagick')
_code=$(curl -s http://captvty.fr/ | grep -Pom 1 '(?<=ref=\")[^\"].*captvty-.*.zip' | awk -F "/" '{print $(NF-1)}')
source=("http://releases.captvty.fr/$_code/captvty-$pkgver.zip"
        "${pkgname}.ico::http://captvty.fr/favicon.ico?v=2"
        'captvty.desktop'
        'captvty'
        'LICENSE')
sha512sums=('fcaa6c7dab5c9b093ce01ea86b2a247ea4b46b78c0d490859b8939f4da161b646c79df052038683f5ac1b8294f5560f35029615fe727edf72de4b49291a1118d'
            '99ea2f64ebe8e5b3a4f9e3a6b3c968f058ab9fd9f806b82d47aa7dcca929a94783f9a40719930ae90c95016653eaa5954e39d476875e845e30a73dea8af3ebf4'
            'e98ee2eb443cb4e60de767b2f0246e2f7bf9cbfb5f25811df57884850605cffc91931d09382baf044a928882fd04bbf7c179f11a3c1ca0d72f9e0c2a3bc25705'
            'e98ee2eb443cb4e60de767b2f0246e2f7bf9cbfb5f25811df57884850605cffc91931d09382baf044a928882fd04bbf7c179f11a3c1ca0d72f9e0c2a3bc25705'
            'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e')

prepare() {
  cd $srcdir
  convert captvty.ico captvty.png
}

package() {
  cd $srcdir
  install -d -m755 $pkgdir/usr/share/$pkgname/ $pkgdir/usr/share/applications/ $pkgdir/usr/bin/
  install -m644 Captvty.exe Captvty.exe.config $pkgdir/usr/share/$pkgname
  install -m644 captvty-8.png $pkgdir/usr/share/$pkgname/captvty.png
  cp -r tools $pkgdir/usr/share/$pkgname
  install -D -m644 captvty.desktop $pkgdir/usr/share/applications/
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
  install -D -m755 captvty $pkgdir/usr/bin/
}


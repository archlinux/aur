pkgname=captvty-alpha
pkgver=3.0.0.38312
pkgrel=1
pkgdesc='Access to the live and shows provided by various french TV channels'
arch=('i686' 'x86_64')
url='http://www.captvty.fr'
license=('custom')
depends=('winetricks' 'wine-mono' 'libjpeg6-turbo')
depends_x86_64=('lib32-libjpeg6-turbo')
makedepends=('imagemagick')
_code=$(curl -s http://v3.captvty.fr/ | grep -Pom 1 '(?<=ref=\")[^\"].*captvty-.*.zip' | awk -F "/" '{print $(NF-1)}')
source=("http://releases.captvty.fr/$_code/captvty-$pkgver.zip"
        "captvty.ico::http://captvty.fr/favicon.ico?v=2"
        'captvty-alpha.desktop'
        'captvty-alpha'
        'LICENSE')
sha1sums=('5b44958d554b6a74b18fd972b876b0c947b56ed0'
          '7210acfa98cb21ab32de463ccf0456743241b48e'
          '77dedd0f30f56bdc31ec2100882747a6e72558bd'
          '2977883980e01ae3487aecbd0a243d4f324e3847'
          'a1a03fcff4541bbf212eb20730d5e344ae817a5d')

prepare() {
  cd $srcdir
  convert captvty.ico captvty.png
}

package() {
  cd $srcdir
  install -d -m755 $pkgdir/usr/share/$pkgname/ $pkgdir/usr/share/applications/ $pkgdir/usr/bin/
  install -m644 Captvty.exe Captvty.exe.config $pkgdir/usr/share/$pkgname
  install -m644 captvty-8.png $pkgdir/usr/share/$pkgname/captvty.png
  cp -r bin $pkgdir/usr/share/$pkgname
  install -D -m644 captvty-alpha.desktop $pkgdir/usr/share/applications/
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
  install -D -m755 captvty-alpha $pkgdir/usr/bin/
}


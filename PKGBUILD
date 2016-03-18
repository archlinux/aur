pkgname=captvty
pkgver=2.3.10.2
pkgrel=2
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
sha1sums=('ef95a4b228aa0a95f2b85cb606b16961cd9b98f1'
          '7210acfa98cb21ab32de463ccf0456743241b48e'
          'c2780184a4580a4dbccac05e8cba1a9fd0129061'
          'b0dd6f93522393f1d5b849988fb0256ad872b3fc'
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
  cp -r tools $pkgdir/usr/share/$pkgname
  install -D -m644 captvty.desktop $pkgdir/usr/share/applications/
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
  install -D -m755 captvty $pkgdir/usr/bin/
}


# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=eclipse-pony-splash
pkgver=1.1
pkgrel=2
pkgdesc="Pony splash screen for Eclipse"
arch=('any')
url="http://www.equestriadaily.com/"
license=('custom' 'BSD')
depends=('eclipse' 'python')
makedepends=('imagemagick' 'curl')
install=setupsplash.install
source=('setupsplash.py')
sha1sums=('9eca5e73f3440b97b6caf2fa4adb13cff8bf820e')
conflicts=('eclipse-motivational-splash' 'eclipse-black-splash')

build() {
  cd "$srcdir"

  msg2 "Downloading and resizing splash image..."
  curl "http://2.bp.blogspot.com/-OaXl2iSmvU8/Tbiapjq-U_I/AAAAAAAAD2c/yGbD5PcUdic/s1600/272d58513f6d1ab89c92f13a999d1270-d3ezdfi.png" \
    --progress-bar -o splash.png
  # standard size is 455x295
  convert -resize 455x295 splash.png splash.bmp  
  echo "Public domain? Fair use?" > LICENSE
}

package() {
  cd "$srcdir"

  install -Dm755 setupsplash.py \
    "$pkgdir/usr/bin/setup_eclipse_splash"
  install -Dm644 splash.bmp \
    "$pkgdir/usr/share/eclipse-splash/splash.bmp"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

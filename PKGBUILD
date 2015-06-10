# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=eclipse-motivational-splash
pkgver=1.1
pkgrel=2
pkgdesc="Motivational splash screen for Eclipse"
arch=('any')
url="http://thxforthe.info/"
license=('custom' 'BSD')
depends=('eclipse' 'python')
makedepends=('imagemagick' 'curl')
install=setupsplash.install
source=('setupsplash.py')
sha1sums=('3aff3c10b7a1b12c7f4f3774393fcaf4ea02a502')
conflicts=('eclipse-pony-splash' 'eclipse-black-splash')

build() {
  cd "$srcdir"

  msg2 "Downloading and resizing splash image..."
  curl "http://thxforthe.info/blog/wp-content/uploads/2008/12/fuck-yeah.jpg" \
    --progress-bar -o splash.jpg
  # standard size is 455x295
  convert -resize 455x295 splash.jpg splash.bmp  
  echo "Public domain? Fair use?" > LICENSE
}

package() {
  cd "$srcdir"

  install -Dm755 setupsplash.py \
    "$pkgdir/usr/bin/setup_eclipse_motivational_splash"
  install -Dm644 splash.bmp \
    "$pkgdir/usr/share/eclipse-motivational-splash/splash.bmp"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

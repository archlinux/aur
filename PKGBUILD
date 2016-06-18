# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=wine_gecko-stable
pkgver=2.40
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's Internet Explorer (for wine-stable)"
arch=(i686 x86_64)
url="http://wiki.winehq.org/Gecko"
license=(MPL)
depends=('wine-stable')
provides=('wine_gecko')
conflicts=('wine_gecko')
source=(http://dl.winehq.org/wine/wine-gecko/$pkgver/wine_gecko-$pkgver-x86{,_64}.msi)
sha256sums=('1a29d17435a52b7663cea6f30a0771f74097962b07031947719bb7b46057d302'
            'c3e28988e7d92221596fc4c569d10eb4dd2ca64b9f4970bf77e791f5dd8c9230')

if [[ $CARCH == i686 ]]; then
  # Strip x86_64 msi
  source=(${source[0]})
  sha256sums=(${md5sums[0]})
fi

package() {
  _geckodir="$pkgdir/usr/share/wine/gecko"

  install -Dm644 wine_gecko-$pkgver-x86.msi "$_geckodir/wine_gecko-$pkgver-x86.msi"
  if [[ $CARCH == x86_64 ]]; then
    install -m644 wine_gecko-$pkgver-x86_64.msi "$_geckodir/"
  fi
}

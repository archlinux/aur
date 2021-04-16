# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=grimshot
pkgver=1.6
pkgrel=1
pkgdesc="A helper for screenshots within sway."
arch=("x86_64")
url="https://github.com/swaywm/sway"
license=('MIT')
replaces=('swaygrab')
depends=("sway" "grim" "slurp" "jq" "xdg-user-dirs")
optdepends=('libnotify: Notify users when a screenshot is taken'
            'wl-clipboard: Copy screenshots')
makedepends=("scdoc")
source=(
  "$pkgname-$pkgver::https://raw.githubusercontent.com/swaywm/sway/${pkgver}/contrib/grimshot"
  "$pkgname-$pkgver.1.scd::https://raw.githubusercontent.com/swaywm/sway/${pkgver}/contrib/grimshot.1.scd"
)
md5sums=('c39dda47a87a0583d6f9e54eb35cdead'
         '492840e7d947718adb4ffeb14e8fc802')


build() {
  cd "$srcdir/"
  scdoc < $pkgname-$pkgver.1.scd > grimshot.1
}

package() {
  cd "$srcdir/"

  install -Dm 644 grimshot.1 "$pkgdir/usr/share/man/man1/grimshot.1"
  install -Dm 755 grimshot "$pkgname-$pkgver/usr/bin/grimshot"
}

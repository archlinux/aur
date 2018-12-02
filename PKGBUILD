# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

pkgname=ipwm
pkgver=1.1
pkgrel=1
pkgdesc='PWM frequency configuration tool for i915'
arch=('i686' 'x86_64')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
conflicts=(intelpwm-udev)
backup=('etc/ipwm.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2c8a72cc2fa238a5fea92f263b8eab81c2a882228c10cb2f00b184ee6e360f75')
install="$pkgname.install"

_makeflags=(BINDIR='/usr/bin'
            LIBDIR='/usr/lib'
            SYSCONFDIR='/etc'
            MKINITCPIODIR='/usr/lib/initcpio')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make "${_makeflags[@]}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" "${_makeflags[@]}" install
}

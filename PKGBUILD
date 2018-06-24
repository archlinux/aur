# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

pkgname=ipwm
pkgver=1.0
pkgrel=1
pkgdesc='PWM frequency configuration tool for i915'
arch=('i686' 'x86_64')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
conflicts=(intelpwm-udev)
backup=('etc/ipwm.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fd3a1d914bacb78642b669ff27995817997d03359f8511707e7b7bdcdc458617')
install="$pkgname.install"

_makeflags=(BINDIR='/usr/bin'
            LIBDIR='/usr/lib'
            MODPROBEDIR='/usr/lib/modprobe.d'
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

# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=('libudev0')
pkgver=182
pkgrel=2
pkgdesc="Dynamic library to access udev device information, legacy libudev.so.0."
url="https://www.kernel.org/pub/linux/utils/kernel/hotplug/udev/udev.html"
arch=('x86_64' 'i686')
license=('GPL')
makedepends=('gperf')
source=("https://www.kernel.org/pub/linux/utils/kernel/hotplug/udev-182.tar.xz")
sha256sums=('adb8892f3b8e4b7163703ed4a545774721a3d55a1062de001f08c477c03d97ab')

prepare() {
   cd "${srcdir}/udev-${pkgver}"
   autoreconf -vfi
}

build() {
  cd "${srcdir}/udev-${pkgver}"
  ./configure \
    --disable-gudev \
    --disable-introspection \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib/udev
  make LIBS="-lrt"
}

package() {
  cd "${srcdir}/udev-${pkgver}"
  install -Dm755 .libs/libudev.so.0.13.1 "${pkgdir}/usr/lib/libudev.so.0.13.1"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -s "/usr/lib/libudev.so.0.13.1" "${pkgdir}/usr/lib/libudev.so.0"
}
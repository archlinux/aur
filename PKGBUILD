# Maintainer: John K. Luebs <https://github.com/jkl1337>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/jkl1337/packages-archlinux.git

pkgname=hid-retrobit-dkms
_pkgname=hid-retrobit
pkgver=1.0.0
pkgrel=2
pkgdesc="kernel module to support useful but broken Retrobit console control adapters"
arch=('i686' 'x86_64')
url="https://github.com/retuxx/hid-retrobit"
license=('GPL')
depends=('dkms')
optdepends=('linux-headers: needed if using archlinux default kernel'
            'linux-lts-headers: needed if using the archlinux lts kernel')
provides=('hid-retrobit')
replaces=('hid-atari-retrobit')
conflicts=('hid-atari-retrobit')
install=hid-retrobit-dkms.install
source=($_pkgname-$pkgver.tar.gz::https://github.com/retuxx/$_pkgname/archive/v1.0.0.tar.gz)
sha256sums=('ead8fc52f79be75f0b47ab412a880dc895c60dc5effc02d02264fe2b77862370')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  install -D -m644 99-hid-retrobit.rules "${pkgdir}/usr/lib/udev/rules.d/99-hid-retrobit.rules"

  install -dm755 "${pkgdir}/usr/src/$_pkgname-${pkgver}/"
  install -m644 COPYING DETAILS.md dkms.conf hid-retrobit.c \
          Makefile README.md "${pkgdir}/usr/src/$_pkgname-${pkgver}/"
}

# vim:set ts=2 sw=2 et:

# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=harec
pkgver=0.24.0
pkgrel=1
pkgdesc='The Hare programming language - bootstrapped compiler'
arch=('x86_64' 'aarch64')
url='https://harelang.org/'
license=('GPL-3.0-only')
depends=('glibc' 'qbe')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('651fc34a6053b81c90e405dd53f84c4c9f549baa601dfba1227bdf1d660b461a1f1e20b0e99ac0c2aa8499375ddf37f52c9c05172433359cb777e806701209b3')

prepare() {
  cd "${pkgname}-${pkgver}"

  # configure prefix directory & architecture
  sed \
    -e 's:/usr/local:/usr:' \
    -e "s/^ARCH = .*/ARCH = $CARCH/" \
    configs/linux.mk > config.mk
}

build() {
  cd "${pkgname}-${pkgver}"

  make
}

check() {
  cd "${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}

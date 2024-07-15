# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=harec
pkgver=0.24.2
pkgrel=1
pkgdesc='The Hare programming language - bootstrapped compiler'
arch=('x86_64' 'aarch64')
url='https://harelang.org/'
license=('GPL-3.0-only')
depends=('glibc' 'qbe')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('b7241fc9e3265486982104fad4d21323a591642b7c19edbedaa4f8b299ed9cde8412b0ef95b0faf33fa8aa6153dc5f965199d5778a434823f8c6faabcd38fde3')

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

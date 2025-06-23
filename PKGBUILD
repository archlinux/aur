# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=harec
pkgver=0.25.2
pkgrel=1
pkgdesc='The Hare programming language - bootstrapped compiler'
arch=('x86_64' 'aarch64')
url='https://harelang.org/'
license=('GPL-3.0-only')
depends=('glibc' 'qbe')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('9d6c1e208ef9ab35f56fa0974741f3eadae59b1f8ea1fbe42b012cde827adfd5c7a84336e3f0e94d4ad69cf975f02d930f3bc88c5f6584ad9334f6cfdb3fdd07')

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

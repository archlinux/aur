# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=harec
pkgver=0.26.0
pkgrel=1
pkgdesc='The Hare programming language - bootstrapped compiler'
arch=('x86_64' 'aarch64')
url='https://harelang.org/'
license=('GPL-3.0-only')
depends=('glibc' 'qbe')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('b6e1a0e5ff0ad1600deebe19c88373aa6d448aeac77f29ebc5eb5b560cd63ec3f928bf9844fb00a38bd7bf856a47efddcea1a9dcb54f06f36f958b2f492bdba8')

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

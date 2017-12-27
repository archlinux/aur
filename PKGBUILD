# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: uvok <uvok at online dot de>
# Contributor: Urist <9362773 at gmail.com>

pkgname=bti
pkgver=034
pkgrel=2
pkgdesc='Console client for Twitter and identi.ca'
arch=('x86_64')
url='http://gregkh.github.com/bti/'
license=('GPL')
depends=('pcre' 'libxml2' 'curl' 'liboauth' 'json-c')
source=(http://www.kernel.org/pub/software/web/$pkgname/$pkgname-$pkgver.tar.xz
        0001-Replace-removed-is_error-macro.patch)
sha256sums=('8b4a1a11f529f83956468acadaea9d11db4f03e82afe07fecb84b2d00e9eae83'
            'df18ac4ad58b3ed17ce3ad7150a60375305f25641a791b6c4c4b69c631093a0e')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver
  patch -Np1 -i $srcdir/0001-Replace-removed-is_error-macro.patch
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  
  make DESTDIR="${pkgdir}" install
}

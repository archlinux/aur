# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: uvok <uvok at online dot de>
# Contributor: Urist <9362773 at gmail.com>

pkgname=bti
pkgver=034
pkgrel=4
pkgdesc='Console client for Twitter and identi.ca'
arch=('x86_64')
url='https://gregkh.github.com/bti/'
license=('GPL')
depends=('pcre' 'libxml2' 'curl' 'liboauth' 'json-c')
source=(https://www.kernel.org/pub/software/web/$pkgname/$pkgname-$pkgver.tar.xz
        0001-Replace-removed-is_error-macro.patch)
sha512sums=('2b7cd66cff617f7592863a1a8e03754b3dea314c8eeb98bf0993601d4d4db848a74b26941bbd04f57a348bf0d02aefca4e3125f00fed531a67a3f17f36e665ba'
            'e05c6b4c744338a4679e37c25e16656b029bb995cbe0efd71b986383d812c4c7b9e599d4f758dfeef94a378a2a807275ffe80fb28ff9970a5ec4b039201223f6')

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

# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=flterm
pkgver=2.4
pkgrel=4
pkgdesc='Tool for loading data over serial'
arch=(x86_64)
url=https://github.com/timvideos/flterm
license=(GPL3)
depends=(glibc)
makedepends=(git)
source=(
  $url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz
  $pkgname-2.4-destdir.patch::https://github.com/timvideos/flterm/commit/ac4f8ab7f8b7fd6ae8933bc291acd2e037f320b8.patch
  $pkgname-2.4-flags.patch
)
sha512sums=('b97b5582be2acb841fe94d06c40547a0d1b649b7a6ba8992f8800d4b80f230b8fd49f807823a368a491331652dfb8839b6c0d807bb1f0e6e0f22dbddf43458c0'
            'ac686c97cc9b99ce0d8e0e6f644cfa111e2d13256f6cb79ab4092c4fe00327ab91d099a595f62942a00a37dfa82a9bb366425d64bd0063fbed46bece73c1ae0c'
            '5376e1fd612d7a9bf1fef9d7e89258c8645c2cbc8bb5bea843adc122da6afa5264a0c08a1f9dd2a80f22ddd0f2a943bedf29eb186e3aec84285709d17cb54eb8')
b2sums=('dd5607056b9ca91cb156a55d67ba9dc5cacb7783a7f75af7aa6ca26a9274d384691280ce70d7ba6d66494412bb45e36b085369817843c7defe0083e66fe9778d'
        '37518fa8ea466c2acee3204283464e5e1ce53d7fcf50e48ed0fe2230a5b6ced728f6a6691865467efaca8eda0cfa625ac7a370123ba3a44787157ebc68fdbbdd'
        '29ae3bd4b2f2899e32ca6e17689ec17fbc5227b50de8a04cbb25e3e69f398eedcff64796027c06fa3c76ef9cff6e3a7be3ff4c0db27deddbcb0a38cd922c6027')

prepare() {
  # support DESTDIR when installing
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-2.4-destdir.patch
  # honor CFLAGS and LDFLAGS
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-2.4-flags.patch
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  make PREFIX=/usr DESTDIR="$pkgdir" install -C $pkgname-$pkgver
}


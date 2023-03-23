# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=flterm
pkgver=2.4
_commit=5742638d64f47eee999de1526c584709792d97e6  # refs/tags/v2.4
pkgrel=3
pkgdesc='Tool for loading data over serial'
arch=(x86_64)
url=https://github.com/timvideos/flterm
license=(GPL3)
depends=(glibc)
makedepends=(git)
source=(
  git+$url#tag=$_commit
  $pkgname-2.4-destdir.patch::https://github.com/timvideos/flterm/commit/ac4f8ab7f8b7fd6ae8933bc291acd2e037f320b8.patch
  $pkgname-2.4-flags.patch
)
sha512sums=('SKIP'
            'ac686c97cc9b99ce0d8e0e6f644cfa111e2d13256f6cb79ab4092c4fe00327ab91d099a595f62942a00a37dfa82a9bb366425d64bd0063fbed46bece73c1ae0c'
            'bf3e20fc7f85c493e7876250dea51ed5076a20118cb1131ef7fd19c83440cd48ab5bd0b33ac049f52e2353d213792934dbb100b2c8eec2d7c34ac8dee5d15b30')
b2sums=('SKIP'
        '37518fa8ea466c2acee3204283464e5e1ce53d7fcf50e48ed0fe2230a5b6ced728f6a6691865467efaca8eda0cfa625ac7a370123ba3a44787157ebc68fdbbdd'
        '4b071bdddaebc748f83631fee8603853bc182df7b7df1c7e720157925821ea14bd631b74dc94462381d02fb635b61e03c8ee2a211d956c6fe3c573669783baa6')

prepare() {
  # support DESTDIR when installing
  patch -Np1 -d $pkgname -i ../$pkgname-2.4-destdir.patch
  # honor CFLAGS and LDFLAGS
  patch -Np1 -d $pkgname -i ../$pkgname-2.4-flags.patch
}

build() {
  make -C $pkgname
}

package() {
  make PREFIX=/usr DESTDIR="$pkgdir" install -C $pkgname
}


# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-rime
pkgver=0.3.2
pkgrel=4
pkgdesc='Fcitx Wrapper for librime'
arch=('x86_64')
url="https://github.com/fcitx/fcitx-rime"
license=('GPL')
depends=('fcitx' 'librime')
makedepends=('cmake')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig}
        'https://github.com/fcitx/fcitx-rime/commit/07dc308024a3dd7992467a915f033f0893efa54b.patch'
        'fix-rime-process-key.patch')
sha512sums=('8c6d845b0899d9b8b9b41b895abd5c1b8916856b71f529aabd08d1c27a2b09bb5a9343912d088da460c2e22da0a3ce759a34fd13099a149bb8cd1ff4eafe29f1'
            'SKIP'
            'e01397967139fc6077bac25900021773d769b305d7e45b6a12bdf954ec7df4f48dc483bee68add1d5693f6bf2501a4cb9506df983fa6de24b38ecb65dfa574d4'
            'b4b64f52cfedc13e4882b20e04800b6531136150a21985e88a61c4ec689d418e4b820ca1e98408b9cb7ac3df890f6b1fea31d0372056c4017da8d340e4ee0f83')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian <wengxt@gmail.com>

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "$srcdir/07dc308024a3dd7992467a915f033f0893efa54b.patch"
  patch -Np1 -i "$srcdir/fix-rime-process-key.patch"
}

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

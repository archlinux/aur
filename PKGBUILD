# Maintainer: Benoît Rouits <brouits at free dot fr>
pkgname=qabc
pkgver=1.14
pkgrel=2
pkgdesc="ABC music notation minimal GUI."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/be1/qabc"
license=('GPL3')
depends=('qt6-base' 'abcm2ps' 'abcmidi' 'fluidsynth' 'soundfont-fluid' 'shared-mime-info')
makedepends=('qt6-tools')
groups=(abc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/be1/qabc/archive/refs/tags/$pkgver.tar.gz" "soundfont.patch")
sha512sums=('41e8ef3689bb36af8b2e3c7758868c3e8551ddf377e9a7dc94c36acbdc79eeb151c093b6d592b4cdb82581c384f695f94ac7443a4d45f72ccfab5c28188b08f8' 'edf3a10be120a452a4b024f0adb55bb5a4ec1ffcb56fcf7d8bdeb83189152baa5ebe77c873167d6ea23472b1575ffecab6c0810371a40234f2bda03a29dc00f8')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../soundfont.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake6 PREFIX=/usr -config release
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install INSTALL_ROOT="${pkgdir}"
}

# vim:set ts=2 sw=2 et:

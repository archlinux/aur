# Maintainer: Benoît Rouits <brouits at free dot fr>
pkgname=qabc
pkgver=1.15
pkgrel=1
pkgdesc="ABC music notation minimal GUI."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/be1/qabc"
license=('GPL3')
depends=('qt6-base' 'abcm2ps' 'abcmidi' 'fluidsynth' 'soundfont-fluid' 'shared-mime-info')
makedepends=('qt6-tools')
groups=(abc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/be1/qabc/archive/refs/tags/$pkgver.tar.gz" "soundfont.patch")
sha512sums=('b48cc3270f97d291e1ff0d09105307854012d5c4b3af4e5525f954704b40ef24263b50a1f8df68b66dbc82de23f02fdea68212b4abecda293facce53af102cab' 'edf3a10be120a452a4b024f0adb55bb5a4ec1ffcb56fcf7d8bdeb83189152baa5ebe77c873167d6ea23472b1575ffecab6c0810371a40234f2bda03a29dc00f8')

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

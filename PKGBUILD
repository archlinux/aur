# Maintainer: Network_Jack <Network_Jack@null.net>
# Poached from Arch Strike: ArchStrike <team@archstrike.org>

pkgname=rifiuti2
pkgver=0.8.2
pkgrel=1
pkgdesc="Tool foranalyzing Windows Recycle Bin INFO2 file."
url="https://github.com/abelcheung/rifiuti2"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('custom:BSD')
depends=('glib2')
makedepends=('cmake' 'ninja')
conflicts=('rifiuti')
options=('!emptydirs')
source=("https://github.com/abelcheung/rifiuti2/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('c378523e5929eba794b004ee306c22a2b99625bfdfae1b1603cd82bd427aeb1063fc9a0d16535af8d0df9abdbbd7dd26a232e7d25300fe2e24cc8160cb20b3f3')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cd _build && ctest -T test --progress
}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -S . -B _build -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake --build _build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake --install _build --prefix "${pkgdir}/usr"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/rifiuti2/LICENSE"
}


# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Poached from Arch Strike: ArchStrike <team@archstrike.org>

pkgname=rifiuti2
pkgver=0.8.1
pkgrel=1
pkgdesc="A rewrite of rifiuti, a great tool from Foundstone folks for analyzing Windows Recycle Bin INFO2 file."
url="https://github.com/abelcheung/rifiuti2"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('custom:BSD')
depends=('glib2')
makedepends=('cmake' 'ninja')
conflicts=('rifiuti')
options=('!emptydirs')
source=("https://github.com/abelcheung/rifiuti2/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('1c08442a7f112110c66adc8c6b5e81776a35bf105d4089a5c3f6c0007b55138ef2d5a492b7cb8498b75afc7d9ada649fc58a86bfe1e631abc8306378d6fdcf25')

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


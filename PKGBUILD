# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=dmoji
pkgver=0.5
pkgcommit=19af4ba
pkgrel=1
pkgdesc="emoji selector program"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('icu' 'dmenu' 'xsel')
optdepends=('rofi: to use rofi instead of dmenu')
url="https://github.com/cedricbu/dmoji"

source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bad1196394bfd60e972e39e9da7ac8878233f1796149dc2d134a973576506761')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make GIT_VERSION="${pkgver}" GIT_COMMIT="${pkgcommit}"
}

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX="${pkgdir}/usr/" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

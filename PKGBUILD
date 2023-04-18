# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=dmoji
pkgver=0.6
pkgcommit=88c09c7
pkgrel=1
pkgdesc="emoji selector program"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('icu' 'dmenu' 'xsel')
optdepends=('rofi: to use rofi instead of dmenu'
            'xdotool: for autotype support')
url="https://github.com/cedricbu/dmoji"

source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8494d9c60ef7ab22a8d0cfafd9c0a25f9c6cc680baeecc3c9c8374ce3dd7e1d5')

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

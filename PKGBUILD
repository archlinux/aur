# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=xplugd
pkgver=1.4
pkgrel=2
pkgdesc="monitor, keyboard, and mouse [un]plug helper for X"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/troglobit/xplugd"
depends=('libx11' 'libxi' 'libxrandr')
optdepends=('sh: example script')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=(${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('6059cf92075fc5c32c3ff427447f3de66afb64d768459065d422f72d4ee363f4')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

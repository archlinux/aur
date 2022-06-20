# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=python-minecraft-launcher-lib
pkgver=4.6
pkgrel=3
pkgdesc="A Python library for creating a custom minecraft launcher"
arch=("any")
url="https://gitlab.com/JakobDev/minecraft-launcher-lib"
license=("BSD")
depends=("python" "python-requests")
makedepends=("python-setuptools" "python-sphinx")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/minecraft-launcher-lib/-/archive/${pkgver}/minecraft-launcher-lib-${pkgver}.tar.gz")
sha256sums=("c323b5eada3a52bc2012df55ebaefa25fb427b987a094e0f971087e8e941541c")

build() {
      cd "minecraft-launcher-lib-${pkgver}/doc"
      make man html
}

package() {
      cd "minecraft-launcher-lib-${pkgver}"
      python setup.py install --root="$pkgdir/" --optimize=1
      install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
      install -Dm644 "doc/_build/man/minecraft-launcher-lib.1" -t "${pkgdir}/usr/share/man/man1"
      mkdir -p "${pkgdir}/usr/share/doc/python-minecraft-launcher-lib"
      cp -r doc/_build/html/* "${pkgdir}/usr/share/doc/python-minecraft-launcher-lib"
}

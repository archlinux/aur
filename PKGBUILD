# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=python-minecraft-launcher-lib
pkgver=3.6
pkgrel=1
pkgdesc="A Python library for creating a custom minecraft launcher"
arch=("any")
url="https://gitlab.com/JakobDev/minecraft-launcher-lib"
license=("BSD")
depends=("python" "python-requests")
makedepends=("python-setuptools" "python-sphinx" "gzip")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/minecraft-launcher-lib/-/archive/${pkgver}/minecraft-launcher-lib-${pkgver}.tar.gz")
sha256sums=("b071f668032c0818b5ff50774e24558ba7cb83fb95c422bc2445924ffdb22651")

build() {
      cd "minecraft-launcher-lib-${pkgver}/doc"
      make man
      gzip -f "_build/man/minecraft-launcher-lib.1"
}

package() {
      cd "minecraft-launcher-lib-${pkgver}"
      python setup.py install --root="$pkgdir/" --optimize=1
      install -Dm644 "doc/_build/man/minecraft-launcher-lib.1.gz" -t "${pkgdir}/usr/share/man/man1"
      install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

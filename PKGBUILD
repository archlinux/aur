# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=python-minecraft-launcher-lib
pkgver=4.6
pkgrel=1
pkgdesc="A Python library for creating a custom minecraft launcher"
arch=("any")
url="https://gitlab.com/JakobDev/minecraft-launcher-lib"
license=("BSD")
depends=("python" "python-requests")
makedepends=("python-setuptools" "python-sphinx")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/minecraft-launcher-lib/-/archive/${pkgver}/minecraft-launcher-lib-${pkgver}.tar.gz")
sha256sums=("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")

build() {
      cd "minecraft-launcher-lib-${pkgver}/doc"
      make man
}

package() {
      cd "minecraft-launcher-lib-${pkgver}"
      python setup.py install --root="$pkgdir/" --optimize=1
      install -Dm644 "doc/_build/man/minecraft-launcher-lib.1" -t "${pkgdir}/usr/share/man/man1"
      install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

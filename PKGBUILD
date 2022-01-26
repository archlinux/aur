# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=nspawn-tools
pkgver=1.1.2
pkgrel=5
pkgdesc="Convenience code for dealing with systemd-nspawn machines"
arch=("any")
url="https://github.com/djmattyg007/nspawn-tools"
license=("GPL3")
depends=("python" "python-executor" "python-humanfriendly" "python-parse" "python-proc")
makedepends=("python-setuptools")
source=("https://github.com/djmattyg007/nspawn-tools/archive/${pkgver}.tar.gz")
sha512sums=("5900f959ac1f5267b69b48e1aca45b3407609870b1c05f84d1a94fceaa46cc327ef083e400310c974b995be324b642af5a8db45f64cb006f3538ea6e846fe9f4")

build() {
    cd "nspawn-tools-${pkgver}"

    python setup.py build
}

package() {
    cd "nspawn-tools-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/nspawn-tools/LICENSE.txt"
    install -Dm644 README.txt "${pkgdir}/usr/share/doc/nspawn-tools/README.txt"
}

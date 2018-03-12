# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="karton"
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to transparently run Linux programs on macOS or on another Linux distro, or a different architecture"
url="https://karton.github.io/"
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('docker')
provides=("${pkgname}")
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('90d8931ccc61a69c2fe3dc5a4754c67fa5ed5f00a71a89e432150f3cbff97e45')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make MANIFEST.in
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"/ --optimize=1
    install -D -m644 COPYING.LGPL2 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=2 ft=sh et

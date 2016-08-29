# Maintainer: Martchus <martchus@gmx.net>
# Co-Maintainer: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jason Giangrande <jgiangrande@clarku.edu>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_pkgname=pyusb
pkgbase=python-pyusb
pkgname=('python-pyusb' 'python2-pyusb')
pkgver=1.0.0
pkgrel=3
arch=('any')
url="https://github.com/walac/${_pkgname}"
license=('custom')
makedepends=('python-distribute' 'python2-distribute')
conflicts=($_pkgname=$pkgver)
source=("https://github.com/walac/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('af5549750140d12229202e8c32f48d6f2bbcda632b43763f7cefc51f63c61d5d9c4bf816842019729c911aedca792269a2cacad08d668d7ec569038b9979e3de')

prepare() {
    # Create a copy for the python2 package
    cp -r "${_pkgname}-${pkgver}" "python2-${_pkgname}-${pkgver}"
}

package_python-pyusb() {
    pkgdesc="USB access on python3"
    depends=('python' 'libusb')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-pyusb() {
    pkgdesc="USB access on python2"
    depends=('python2' 'libusb')
    replaces=('python2-pyusb-beta')

    cd "${srcdir}/python2-${_pkgname}-${pkgver}"
    python2 setup.py install --root=${pkgdir} --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

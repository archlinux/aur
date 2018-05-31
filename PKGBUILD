# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

_realname=z-base-36
pkgname=python2-${_realname}
pkgver=1.0.1
pkgrel=1
pkgdesc="base36 encoder/decoder"
depends=("python2-pyutil")
makedepends=("python2-setuptools")
arch=("any")
url="https://pypi.org/project/z-base-36/"
license=("BSD")
source=(
    "https://pypi.python.org/packages/e1/7c/77dab474ecc4e6c9edfaf107facb17c538afd9d231b8f07fa5299409073f/${_realname}-${pkgver}.tar.gz"
    "LICENSE"
)
sha256sums=(
    "7ae6b4a19d3d88aa657d83c4cbf5009e0efec09db4ad38ea34090035c6173658"
    "0cc33c1482e1956eead8b55d1bd82e1d2f0a4cdc9c20a893bebbbabd1e5d3e61"
)

package() {
    cd "${srcdir}/${_realname}-${pkgver}"
    rm -f ez_setup.py
    rm -f base36/test/test_base36.py
    sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' base36/base36.py
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

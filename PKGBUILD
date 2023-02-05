# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgbase='python-aimrecords'
pkgname=('python-aimrecords')
_module='aimrecords'
pkgver='0.0.7'
pkgrel=1
pkgdesc="A record-oriented data format which utilizes Protocol Buffers"
url="https://github.com/aimhubio/aimrecords"
depends=('python' 'python-base58')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('9b562fa5b5109b4b3dd4f83be0061cadbac63fa8031f281b8b5c8ae29967072f')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}" || exit 1
    sed -i 's:^from collections import Iterator$:from collections.abc import Iterator  # adhoc fix:' \
      'aimrecords/artifact_storage/storage.py'
    sed -i 's:^from collections import namedtuple, Iterator$:from collections import namedtuple; from collections.abc import Iterator  # adhoc fix:' \
      'aimrecords/record_storage/reader.py'
}

build() {
    cd "${srcdir}/${_module}-${pkgver}" || exit 1
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}" || exit 1
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

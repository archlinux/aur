# Maintainer: Gokberk Yaltirakli <aur at gkbrk dot com>
# Contributor: Stephanie Wilde-Hobbs (RX14) <steph@rx14.co.uk>

pkgname=mcstatus
pkgver=7.0.0
pkgrel=1
pkgdesc="Provides an easy way to query Minecraft servers for any information they can expose."
arch=(any)
url="https://github.com/Dinnerbone/mcstatus"
license=('Apache')
depends=(python python-six python-click python-dnspython python-asyncio-dgram)
makedepends=(python-setuptools python-poetry python-dephell)
source=("https://github.com/Dinnerbone/mcstatus/archive/v${pkgver}.tar.gz")
sha256sums=('9ddc56243b33528dd79b6c27bc6c88c8a61bef82a5b96634661b3c616b092713')

prepare () {
    cd "${srcdir}/mcstatus-${pkgver}"

    dephell deps convert --from pyproject.toml --to setup.py --envs main
}

build () {
  cd "${srcdir}/mcstatus-${pkgver}"

  python setup.py build
}

package () {
  cd "${srcdir}/mcstatus-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

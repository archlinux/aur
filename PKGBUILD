# Maintainer: Gokberk Yaltirakli <aur at gkbrk dot com>
# Contributor: Stephanie Wilde-Hobbs (RX14) <steph@rx14.co.uk>

pkgname=mcstatus
pkgver=9.0.4
pkgrel=1
pkgdesc="Provides an easy way to query Minecraft servers for any information they can expose."
arch=(any)
url="https://github.com/py-mine/mcstatus"
license=('Apache')
depends=(python python-six python-click python-dnspython python-asyncio-dgram)
makedepends=(python-setuptools python-poetry python-dephell)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e113bde1aaa8756c507501668d2513651b470771b736a1a9bcae63f403c5d560')

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

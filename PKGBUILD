# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Gokberk Yaltirakli <aur at gkbrk dot com>
# Contributor: Stephanie Wilde-Hobbs (RX14) <steph@rx14.co.uk>

pkgname=mcstatus
pkgver=14.1.0
pkgrel=1
pkgdesc="Provides an easy way to query Minecraft servers for any information they can expose."
arch=(any)
url="https://github.com/py-mine/mcstatus"
license=('Apache-2.0')
depends=(python python-dnspython python-asyncio-dgram python-typing_extensions)
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-uv-dynamic-versioning')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/m/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4f9bd17ecf29b3bad9af8811b33126e996e197526d1d72554dc4f1f7e86a2fb0')

latestver() {
    gh api repos/py-mine/mcstatus/releases/latest --jq '.tag_name' | sed 's/^v//'
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

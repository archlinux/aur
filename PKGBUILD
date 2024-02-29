# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>
# Contributor: entriphy <t4ils.dev@gmail.com>

pkgname=python-pyrogram
_pkgname=pyrogram
pkgver=2.0.106
pkgrel=2
pkgdesc="Elegant, modern and asynchronous Telegram MTProto API framework in Python for users and bots"
arch=("any")
url="https://github.com/pyrogram/$_pkgname"
license=("LGPL-3.0-or-later")
depends=("python" "python-pyaes" "python-pysocks")
optdepends=("python-tgcrypto: faster cryptography")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
checkdepends=("python-pytest" "python-pytest-asyncio" "python-pytest-cov")
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a7f10140d53707411e464f34dcfa9b646577aa7feb9a842c373b22baf0c184c1')
install="${pkgname}.install"
# Greatly speeds up the `package` fase.
# There are no binaries anyway.
options=(!strip)

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "$_pkgname-$pkgver"
  pytest
}


package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

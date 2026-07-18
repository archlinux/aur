# Maintainer: graysky <graysky AT proton DOT me>
_name=iphone_backup_decrypt
pkgname=python-iphone-backup-decrypt
pkgver=0.9.0
pkgrel=1
pkgdesc="Decrypt and extract files from an iOS13+ encrypted local iTunes/iOS backup offline using the backup password"
arch=(any)
url="https://github.com/jsharkey13/iphone_backup_decrypt"
license=(MIT)
depends=(python-pycryptodome)
makedepends=(python-build python-installer python-wheel python-setuptools)
optdepends=('python-fastpbkdf2: faster key derivation (PBKDF2) via a C extension')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('13b18fef3c8e3af627914f8c1a429bbc5555dfb0505239ba49efe99984cc0c96')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

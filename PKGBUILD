# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>

_pypiname=anyjson
pkgname=python-$_pypiname
pkgver=0.3.3
pkgrel=18
pkgdesc="Wraps the best available JSON implementation available in a common interface"
arch=(any)
url="https://pypi.python.org/pypi/$_pypiname"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(
  "https://files.pythonhosted.org/packages/source/a/$_pypiname/$_pypiname-${pkgver}.tar.gz"
  $_pypiname-$pkgver-python3.11.patch
)
sha256sums=('37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba'
            '5b7867c0b633ffdc0e73361d6bec7ef0707229dc899bd9e40036637067d4f2f7')
b2sums=('196596b832bddf7969fa9f77f7b78e37bf7fbc93dacb2790615555072b1b504b70d43e50bd968969abe92b6503b79d392f344b72b663fc3be700a0e4053c278f'
        '0a18b3ba23ee3cbbd0a109b4ef3607c5034eee3472630abd7fcb1068e3cd73bf24be5251bc0297a49820b3377e4662a0ec293385f085b9a000ea797d022e9b94')

prepare() {
  patch -Np1 -d $_pypiname-$pkgver -i ../$_pypiname-$pkgver-python3.11.patch
}
build() {
  cd "$_pypiname-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pypiname-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

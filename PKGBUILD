# Maintainer:
# Contributor: TheCyberArcher <TheCyberArcher@protonmail.ch>
# Contributor: PumpkinCheshire <sollyonzou@gmail.com>

_module="auditok"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.3.0
pkgrel=2
pkgdesc="An audio/acoustic activity detection and audio segmentation tool."
url="https://github.com/amsehili/auditok"
license=('MIT')
arch=('any')

depends=(
  'python'
  'python-matplotlib'
  'python-numpy'
  'python-pyaudio'
  'python-pydub'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('8565d6e7dfbecb7dbbe5c54fb5af66f8c1c827e06745c19df0e3fa468d0022a1')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

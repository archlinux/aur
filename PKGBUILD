# Maintainer:
# Contributor: TheCyberArcher <TheCyberArcher@protonmail.ch>
# Contributor: PumpkinCheshire <sollyonzou@gmail.com>

_module="auditok"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.4.1
pkgrel=1
pkgdesc="An audio/acoustic activity detection and audio segmentation tool."
url="https://github.com/amsehili/auditok"
license=('MIT')
arch=('any')

depends=(
  'python'
  'python-matplotlib'
  'python-numpy'
  'python-sounddevice' # AUR
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('61aef3d3838e80217ecedc3058521a3c82eec44f650805153045a7b894225b73')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

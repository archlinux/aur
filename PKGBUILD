# Maintainer: aur.chaotic.cx
# Contributor: TheCyberArcher <TheCyberArcher@protonmail.ch>
# Contributor: PumpkinCheshire <sollyonzou@gmail.com>

_module="auditok"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.5.2
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
  'python-webrtcvad'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'ipython: for Jupyter notebook visualization widget'
  'python-tqdm: to display progress bars'
)

_pkgsrc="$_module-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('4a2f654739e9f4cce8a92e3b1f9d08e8b6ca94643462cd2c835809ff8ea7955f')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

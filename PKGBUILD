# Maintainer: aur.chaotic.cx
# Contributor: TheCyberArcher <TheCyberArcher@protonmail.ch>
# Contributor: PumpkinCheshire <sollyonzou@gmail.com>

_module="auditok"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.5.1
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
sha256sums=('c38f04c40c242447bf2d76333f0576751d97726942d3722b2f3d29e064951223')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

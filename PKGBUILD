# Maintainer: aur.chaotic.cx
# Contributor: TheCyberArcher <TheCyberArcher@protonmail.ch>
# Contributor: PumpkinCheshire <sollyonzou@gmail.com>

_module="auditok"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.4.2
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
sha256sums=('52985096cbd3c15d650e71cb252b385875c9031da40ca8584b99fcdd9e26eaa5')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

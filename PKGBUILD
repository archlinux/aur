# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=not1mm-9m2pju-git
pkgver=r1.abcdef
pkgrel=1
pkgdesc="Unofficial Arch Linux AUR package for Not1MM - Ham Radio audio tool"
arch=('any')
url="https://github.com/mbridak/not1mm"
license=('MIT')
depends=(
  'python'
  'python-numpy'
  'python-pyqt6'
  'python-sounddevice'
  'python-soundfile'
  'python-levenshtein'
  'python-xmltodict'
  'python-thefuzz'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname::git+https://github.com/mbridak/not1mm.git")
md5sums=('SKIP')
provides=('not1mm')
conflicts=('not1mm')

pkgver() {
  cd "$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

post_install() {
  echo "─────────────────────────────────────────────"
  echo "✔️  not1mm-9m2pju-git installed."
  echo "⚠️  Please ensure required runtime dependencies are installed:"
  echo "    python-numpy python-pyqt6 python-sounddevice python-soundfile"
  echo "    python-levenshtein python-xmltodict python-thefuzz"
  echo "─────────────────────────────────────────────"
}

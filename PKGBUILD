pkgname=mpvwall-git
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal UI manager for mpvpaper video wallpapers"
arch=('any')
url="https://github.com/methamphetaminelab/mpvwall"
license=('MIT')

depends=(
  'python'
  'mpv'
  'mpvpaper'
  'hyprland'
)

optdepends=(
  'ffmpeg: for video metadata display'
)

makedepends=(
  'git'
  'python-build'
  'python-installer'
)

provides=('mpvwall')
conflicts=('mpvwall')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd mpvwall
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd mpvwall
  python -m build --wheel --no-isolation
}

package() {
  cd mpvwall
  python -m installer --destdir="$pkgdir" dist/*.whl
}

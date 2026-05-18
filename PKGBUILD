# Maintainer: leoallday
pkgname=mov-watch-git
pkgver=2.1.0
pkgrel=1
pkgdesc="Terminal-based movie and TV show streaming (git version)"
arch=('any')
url="https://github.com/leoallday/mov-watch"
license=('MIT')
provides=('mov-watch')
conflicts=('mov-watch')
depends=('python' 'python-rich' 'python-requests' 'python-pypresence' 'yt-dlp' 'python-pillow' 'python-numpy' 'mpv' 'ffmpeg' 'fzf')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
source=("git+https://github.com/leoallday/mov-watch.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mov-watch"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*\)-\([^-]*\)-\(.*\)/\1+r\2.\3/' || echo "${pkgver}"
}

build() {
  cd "${srcdir}/mov-watch"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/mov-watch"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 assets/movie-watch.desktop "$pkgdir/usr/share/applications/movie-watch.desktop"
  install -Dm644 assets/movie-watch.png "$pkgdir/usr/share/pixmaps/movie-watch.png"
}

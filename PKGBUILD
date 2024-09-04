# Contributor: alium
# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=televize-git
pkgdesc="CLI aplication to watch Czech television streams"
pkgver=r98.7b90d33
pkgrel=2
arch=('any')
url="https://github.com/ziima/televize"
license=('GPL-2.0-only')
depends=('python-requests' 'python-m3u8' 'python-lxml' 'python-docopt' 'python-iso8601' 'python-installer')
makedepends=('git' 'python-setuptools' 'python-build' 'python-wheel')
checkdepends=('python-responses')
conflicts=('televize')
provides=('televize')
optdepends=('mplayer: for MPlayer backend'
'mpv: for MPV backend'
'vlc: for VLC backend')
source=("${pkgname}"::'git+https://github.com/ziima/televize.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd ${srcdir}/${pkgname}
  python -m unittest discover
}

build() {
  cd ${srcdir}/${pkgname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

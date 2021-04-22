# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=miniplayer-git
_pkgname=miniplayer
pkgver=r34.69071b6
pkgrel=2
pkgdesc='A curses based mpd client with basic functionality and album art written for the Kitty terminal.'
url='https://github.com/guardkenzie/miniplayer'
depends=('python' 'python-mpd2' 'python-pillow' 'python-ffmpeg' 'python-pixcat' 'python-ueberzug-git')
makedepends=('git' 'python-setuptools')
provides=("miniplayer")
conflicts=("miniplayer")
license=('MIT')
arch=('any')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "${srcdir}/${_pkgname}"

  python setup.py build
}


package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:

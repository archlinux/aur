# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Adam Goldsmith <adam at adamgoldsmith dot name>

pkgname=mopidy-youtube-git
_pkgname=mopidy-youtube
pkgver=3.6.r22.g0a069b7
pkgrel=1
pkgdesc="Mopidy extension for playing music from Youtube"

arch=('any')
url="https://github.com/natumbri/mopidy-youtube"
license=('APACHE')
depends=(
  'mopidy>=3.1'
  'python-pykka>=2.0.1'
  'python-setuptools'
  'python-requests'
  'python-cachetools'
  'python-beautifulsoup4'
  'youtube-dl>=2021.06.01'
  'python-ytmusicapi')
makedepends=('python' 'git')

provides=("$_pkgname=$pkgver")
conflicts=("mopidy-youtube")
source=("$_pkgname::git+$url.git")

pkgver() {
  cd "$_pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;'
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('SKIP')

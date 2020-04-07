# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Adam Goldsmith <adam at adamgoldsmith dot name>

pkgname=mopidy-youtube-git
_pkgname=mopidy-youtube
pkgver=v2.0.2.r296.g00c2162
pkgrel=1
pkgdesc="Mopidy extension for playing music from Youtube"

arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
  'mopidy>=3.0'
  'python-pykka>=2.0.1'
  'python-setuptools'
  'python-requests'
  'python-cachetools'
  'python-beautifulsoup4'
  'youtube-dl')
makedepends=('python' 'git')

conflicts=("mopidy-youtube")
source=("$_pkgname::git+https://github.com/natumbri/mopidy-youtube.git"
	"setupcfg.patch")

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  patch setup.cfg < "$srcdir"/setupcfg.patch
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('SKIP'
         '217a1d4c8a4a1a2f97de7cc88422da23')

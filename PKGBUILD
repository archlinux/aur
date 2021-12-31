# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=bandcamp-dl
pkgname=bandcamp-dl-git
pkgver=v0.0.12.r0.gd35c7ed
pkgrel=1
pkgdesc="download audio from BandCamp.com"
arch=('any')
url="https://github.com/iheanyi/bandcamp-dl"
license=('Unlicense')
makedepends=('git')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-chardet'
  'python-demjson'
  'python-docopt'
  'python-mock'
  'python-mutagen'
  'python-requests'
  'python-unicode-slugify'
  'python-setuptools'
)
provides=("$_pyname")
conflicts=("$_pyname")
options=(!emptydirs)
source=(git://github.com/iheanyi/bandcamp-dl.git)
sha512sums=('SKIP')

pkgver() {
  cd "$_pyname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pyname"
  sed -i -e 's#json+ld#ld+json#' bandcamp_dl/bandcampjson.py
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:

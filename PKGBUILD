# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=bandcamp-dl-git
pkgver=v0.0.13.r4.ge21bb65
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
  'python-demjson3'
  'python-docopt'
  'python-mock'
  'python-mutagen'
  'python-requests'
  'python-unicode-slugify'
  'python-setuptools'
)
provides=("${pkgname/-git/}")
conflicts=("${pkgname/-git/}")
options=(!emptydirs)
source=("git+https://github.com/iheanyi/bandcamp-dl.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname/-git/}"
  sed -i -e 's#json+ld#ld+json#' bandcamp_dl/bandcampjson.py
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=autosub-git
pkgver=r81.d32389c
pkgrel=1
pkgdesc='Command-line utility for auto-generating subtitles for any video file'
arch=('any')
url='https://github.com/agermanidis/autosub'
license=('MIT')
provides=('autosub')
depends=('python-google-api-python-client'
         'python-requests'
         'python-pysrt'
         'python-progressbar'
         'python-six')
makedepends=('python-setuptools')
source=("${pkgname%-git}::git+https://github.com/agermanidis/autosub")
sha256sums=('SKIP')

pkgver() {
  cd autosub
  ( set -o pipefail
   git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd autosub
  python setup.py build
}

package() {
  cd autosub
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
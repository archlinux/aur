# Maintainer: boltgolt <boltgolt@gmail.com>
# Maintainer: Kelley McChesney <kelley@kelleymcchesney.us>
# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
pkgname=pam-python
pkgver=1.0.8
pkgrel=1
pkgdesc='Python for PAM'
arch=('x86_64')
url='http://pam-python.sourceforge.net/'
license=('GNU Affero General Public License')
depends=(
	'pam'
	'python'
)
makedepends=(
	'python-sphinx'
	'make'
)
source=(
  "https://downloads.sourceforge.net/project/pam-python/pam-python-${pkgver}-1/pam-python-${pkgver}.tar.gz"
)
sha256sums=('fc69d7717db0509111500a81053487fa7684e1be3b7d0ae2b51970b6fdc918f6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -n '/^License/,/^--$/p' README.txt | grep -v -e '^License' -e '^-\+' > LICENSE
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PREFIX=/usr make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PREFIX=/usr make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


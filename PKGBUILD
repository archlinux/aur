# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Edgard Castro <castro@edgard.org>
# Contributor: James An <james@jamesan.ca>
# Contributor: Helge Willum Larsen <helgesdk@gmail.com>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>
# Contributor: Byron Clark <byron@theclarkfamily.name> (auto-disper-git)
# Contributor: phillipberndt (maintainer of the current autorandr)
# Contributor: wertarbyte (original author of auto-disper and autorandr)

pkgname=autorandr
pkgver=1.4
pkgrel=1
pkgdesc="Auto-detect the connected display hardware and load the appropiate X11 setup using xrandr."
arch=('any')
url="https://github.com/phillipberndt/autorandr"
license=('GPL3')
depends=('python' 'xorg-xrandr')
optdepends=('xorg-xdpyinfo: For detecting the primary XRandR output')
conflicts=(
  "${pkgname}-git"
  "auto-disper-git"
  "autorandr-asch-git"
  "autorandr-phillipberndt-git"
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/phillipberndt/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('e77818f70e0843e13f796df6c6e991143bc726bdc9fc43baa9759e79f4e5bf4e73b9d2da7cc0684213fafdaae7e1d3a8a802d9333815cbd66f8c6f77feaa93fa')

check() {
  cd "${pkgname}-${pkgver}"
  python setup.py test
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}/"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

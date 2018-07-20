# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Edgard Castro <castro@edgard.org>
# Contributor: James An <james@jamesan.ca>
# Contributor: Helge Willum Larsen <helgesdk@gmail.com>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>
# Contributor: Byron Clark <byron@theclarkfamily.name> (auto-disper-git)
# Contributor: phillipberndt (maintainer of the current autorandr)
# Contributor: wertarbyte (original author of auto-disper and autorandr)

pkgname=autorandr
pkgver=1.6
pkgrel=1
pkgdesc="Auto-detect connected display hardware and load appropiate X11 setup using xrandr"
arch=('any')
url="https://github.com/phillipberndt/autorandr"
license=('GPL3')
depends=('python-setuptools' 'xorg-xrandr')
optdepends=('xorg-xdpyinfo: For detecting the primary XRandR output')
conflicts=(
  "${pkgname}-git"
  "auto-disper-git"
  "autorandr-asch-git"
  "autorandr-phillipberndt-git"
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/phillipberndt/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('688a7215532e7e6a5090813ca672cbab24276172a149255869479ae3977e0b8aa4bece4978e4a3847a6de02c7aaf3b2a698a9edd465c5cec2add25a0717ff085')

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
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

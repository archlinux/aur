# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Edgard Castro <castro@edgard.org>
# Contributor: James An <james@jamesan.ca>
# Contributor: Helge Willum Larsen <helgesdk@gmail.com>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>
# Contributor: Byron Clark <byron@theclarkfamily.name> (auto-disper-git)
# Contributor: phillipberndt (maintainer of the current autorandr)
# Contributor: wertarbyte (original author of auto-disper and autorandr)

pkgname=autorandr
pkgver=1.5
pkgrel=1
pkgdesc="Auto-detect the connected display hardware and load the appropiate X11 setup using xrandr."
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
sha512sums=('d3feaac1857ba1d280879681b5bae8b5885a0bd31339d42392df29b198373d349251bb24e7bd6f371d89ae61aa1c5374a020e133bdb4c98291484b0c5ac4c6cc')

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
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# Maintainer: Edgard Castro <castro@edgard.org>
# Contributor: James An <james@jamesan.ca>
# Contributor: Helge Willum Larsen <helgesdk@gmail.com>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>
# Contributor: Byron Clark <byron@theclarkfamily.name> (auto-disper-git)
# Contributor: phillipberndt (maintainer of the current autorandr)
# Contributor: wertarbyte (original author of auto-disper and autorandr)

pkgname=autorandr-git
pkgver=1.0.r16.g855c18b
pkgrel=1
pkgdesc="Auto-detect the connect display hardware and load the appropiate X11 setup using xrandr. Formerly autodisper. No disper support."
arch=('any')
url="https://github.com/phillipberndt/${pkgname%-git}"
license=('GPL3')
depends=('python' 'xorg-xrandr')
makedepends=('git')
optdepends=(
  "pm-utils: For changing autorandr profile on thaw/resume"
  "python2: For using autorandr_monitor"
  "xorg-xdpyinfo: For detecting the primary XRandR output"
)
provides=("${pkgname%-git}")
conflicts=(
  "${pkgname%-git}"
  "auto-disper-git"
  "autorandr-asch-git"
  "autorandr-phillipberndt-git"
)
install="${pkgname}.install"
source=(
  "${pkgname}::git+${url}.git"
  "${pkgname}.install"
)
sha256sums=('SKIP'
            '60c035d6f433d388ef1d3acec084dcd021158cbec79e9807e78cc368cb499690')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

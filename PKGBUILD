# Maintainer: James An <james@jamesan.ca>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>
# Contributor: Byron Clark <byron@theclarkfamily.name> (auto-disper-git)
# Contributor: phillipberndt (maintainer of the current autorandr)
# Contributor: wertarbyte (original author of auto-disper and autorandr)

_pkgname=autorandr
pkgname="$_pkgname-git"
pkgver=r96.8429886
pkgrel=1
pkgdesc="Auto-detect the connect display hardware and load the appropiate X11 setup using xrandr or disper. Formerly autodisper."
arch=('i686' 'x86_64')
url="https://github.com/phillipberndt/$_pkgname"
license=('GPL')
depends=()
makedepends=('git')
optdepends=('disper' 'pm-utils')
provides=("$_pkgname")
conflicts=(
    "$_pkgname"
    'autorandr-asch-git'
    'autorandr-phillipberndt-git'
)
source=("$_pkgname"::"git+https://github.com/phillipberndt/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
    make DESTDIR="$pkgdir/" hotplug
}

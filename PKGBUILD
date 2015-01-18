# Maintainer: James An <james@jamesan.ca>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>
# Contributor: Byron Clark <byron@theclarkfamily.name> (auto-disper-git)
# Contributor: phillipberndt (maintainer of the current autorandr)
# Contributor: wertarbyte (original author of auto-disper and autorandr)

_pkgname=autorandr
pkgname="$_pkgname-git"
pkgver=r123.664d140
pkgrel=2
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
install="$pkgname.install"
source=(
    "$_pkgname"::"git+https://github.com/phillipberndt/$_pkgname.git"
    "$pkgname.install"
)
md5sums=(
    'SKIP'
    'bedb41a350cdf6983872119aef71fed6'
)

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    ) 2>/dev/null
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" INSTALL_PATH=/usr/bin install >/dev/null
    make DESTDIR="$pkgdir/" hotplug >/dev/null
}

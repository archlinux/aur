# Maintainer: Tim Liou <wheatdoge at gmail dot com>
_pkgname="i3-workspace-groups"
pkgname="${_pkgname}-git"
pkgver=r166.36abe38
pkgrel=1
pkgdesc='Manage i3wm workspaces in groups you control'
url='https://github.com/infokiller/i3-workspace-groups'
arch=('any')
license=('MIT')
source=("git+https://github.com/infokiller/i3-workspace-groups")
sha256sums=('SKIP')
depends=('python' 'i3-wm' 'python-i3ipc' 'python-toml')
makedepends=('python-setuptools' 'git')
provides=('i3-workspace-groups')
conflicts=('i3-workspace-groups')
install="${pkgname}.install"

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$_pkgname"
    python setup.py build
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

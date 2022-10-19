# Maintainer: Han Luo <han dot luo at gmail dot com>
pkgname=cockpit-navigator-git
_pkgname=${pkgname%-git}
pkgver=r370.d70d66f
pkgrel=1
_commit=d70d66f650c12e10150e50af46ed62b8bf9f88ac
pkgdesc='A Featureful File Browser for Cockpit'
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)
license=('GPL')
makedepends=('git' 'go' 'sed')
depends=('cockpit' 'python' 'rsync' 'zip')
url='https://github.com/45Drives/cockpit-navigator'
_branch='main'
source=("$_pkgname::git+$url.git#branch=$_branch")
arch=('x86_64')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}

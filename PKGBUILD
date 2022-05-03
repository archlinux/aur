##
# Maintainer: zjuyk <ownbyzjuyk(at)gmail(dot)com>
# Contributer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
#
# Updated by jonathon: https://aur.archlinux.org/account/jonathon
##

_gitname=xwinwrap
pkgname="${_gitname}"-git
pkgdesc="Fork of XwinWrap from takase1121 on GitHub"
pkgver=r20.539fc47
pkgrel=1
arch=('x86_64')
makedepends=('git')
depends=('libx11' 'libxext' 'libxrender')
provides=('xwinwrap')
conflicts=('xwinwrap')
license=(custom)
url="https://github.com/takase1121/xwinwrap"
source=("git+${url}#branch=master" LICENSE)
sha256sums=('SKIP'
            '9b445615c864519effd483f60c9877de671708f6c3807841ef1514490ae61903')

pkgver() {
  cd "${_gitname}" || return 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${_gitname}" || return 1
}

package() {
  # From https://bazaar.launchpad.net/~shantanu-goel/xwinwrap/devel/view/head:/xwinwrap.c
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  cd "${_gitname}" || return 1
  install -D xwinwrap "${pkgdir}"/usr/bin/xwinwrap
}


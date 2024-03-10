# Maintainer: Ricardo Constantino <wiiaboo [at] gmail [dot] com>

_extensionname=xExtension-ComicsInFeed
pkgname=freshrss-comicsinfeed-git
pkgver=r15.076e662
pkgrel=1
pkgdesc='In-feed comics for some webcomics'
arch=('any')
url='https://github.com/giventofly/freshrss-comicsinfeed'
license=('MIT')
depends=('freshrss')
makedepends=('git')
source=("${_extensionname}::git+https://github.com/giventofly/freshrss-comicsinfeed.git")
sha256sums=('SKIP')


pkgver(){
  cd "$srcdir/${_extensionname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


package() {
  cd "$srcdir"
  install -d "${pkgdir}"/usr/share/webapps/freshrss/extensions
  cp -r "${_extensionname}" "${pkgdir}"/usr/share/webapps/freshrss/extensions/
  rm -rf "${pkgdir}"/usr/share/webapps/freshrss/extensions/"${_extensionname}"/.git
}

# vim:set ts=2 sw=2 et:

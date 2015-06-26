# Maintainer: Helge Willum Larsen <helgesdk@gmail.com>
pkgname=thunderbird-exchangecalendar-git
pkgver=r1305.30332f5
pkgrel=1
pkgdesc="Synchronize calendar, tasks and contacts with Exchange EWS."
url="https://github.com/Ericsson/exchangecalendar"
arch=('any')
license=('GPL3')
depends=('thunderbird')
makedepends=('git' 'zip')
optdepends=('lightning: Calendar and tasks support')
provides=('thunderbird-exchangecalendar')
source=('git+https://github.com/Ericsson/exchangecalendar.git')
sha256sums=('SKIP')
install="thunderbird-exchangecalendar-git.install"
_gitname=exchangecalendar

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  ./build.sh -d
}

package() {
  _version=`sed -n -e 's/.*<em:version>\(.*\)<\/em:version>.*/\1/p' "$srcdir/$_gitname/install.rdf"`
  mkdir -p "$pkgdir/usr/lib/thunderbird/extensions/"
  cd "$pkgdir/usr/lib/thunderbird/extensions/"
  install -m 644 "$srcdir/$_gitname/exchangecalendar-${_version}.xpi" ./
}


# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=gimp-plugin-xsanecli-git
pkgver=0.0.0.r5.d4fa7e8
pkgrel=1
pkgdesc='GIMP 3.0 plug-in for scanning via XSane'
arch=('any')
url='https://yingtongli.me/git/gimp-xsanecli'
license=('GPL-3.0-or-later')
depends=('gimp' 'xsane')
provides=('gimp-plugin-xsanecli')
conflicts=('gimp-plugin-xsanecli')
source=("git+https://yingtongli.me/git/RunasSudo/gimp-xsanecli.git")
sha256sums=('SKIP')

pkgver() {
  set -o pipefail
  cd gimp-xsanecli

  { git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'; } ||
    printf '0.0.0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd gimp-xsanecli

  install -Dm755 xsanecli.py "$pkgdir/usr/lib/gimp/3.0/plug-ins/xsanecli/xsanecli.py"
}

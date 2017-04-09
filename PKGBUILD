# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=arc-osx-icon-theme-git
pkgver=1.0.0.r10.g3757199
pkgrel=1
pkgdesc="Modern free desktop icon theme whose design is based around the use of bold colours and simple geometric shapes"
url="https://github.com/LinxGem33/Arc-OSX-Icons"
arch=('any')
license=('GPL3' 'CC-BY-SA-4.0')
depends=('gtk-update-icon-cache')
makedepends=('git')
provides=("${pkgname%-*}" 'paper-icon-theme')
conflicts=("${pkgname%-*}" 'paper-icon-theme')
options=('!strip')
source=("${pkgname%-*}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

package() {
  cd "${pkgname%-*}"
  install -d "$pkgdir/usr/share/icons"
  cp -a src/* "$pkgdir/usr/share/icons/"
  sed -i 's|Name=Arc|Name=Arc-OSX-D|' "${pkgdir}/usr/share/icons/Arc-OSX-D/index.theme"
  sed -i 's|Name=Arc|Name=Arc-OSX-P|' "${pkgdir}/usr/share/icons/Arc-OSX-P/index.theme"
  #"Paper Icons" by Sam Hewitt is licensed under CC-SA-4.0
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

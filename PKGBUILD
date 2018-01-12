# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=damadamas-icon-theme-git
pkgver=0.7.r0.g02d288d
pkgrel=1
pkgdesc="DamaDamas icons aim to offer a familiar interface to the users"
url="https://github.com/sonakinci41/DamaDamas-icon-theme"
arch=('any')
license=('GPL3')
depends=('gtk-update-icon-cache')
makedepends=('git' 'python' 'rsync')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=('!strip')
source=("${pkgname%-*}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  sed -e 's|os.path.expanduser("~")+"/.icons"|"./build"|' -i damadamas-installer.py
  python damadamas-installer.py
}

package() {
  cd "${pkgname%-*}"/build
  install -d "$pkgdir/usr/share/icons"
  cp -a DamaDamas-icon-theme "$pkgdir/usr/share/icons/DamaDamas"
}

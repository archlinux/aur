# Maintainer : Arnaud Dovi <mr.dovi@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Robosky <fangyuhao0612@gmail.com>

pkgname=mcmojave-circle-icon-theme-git
pkgver=2023.06.16.r1.953bf798
pkgrel=1
pkgdesc="MacOSX Mojave like circle icon theme for linux desktops"
arch=('any')
makedepends=('git' 'gtk-update-icon-cache')
optdepends=('mojave-gtk-theme-git: Recommended GTK theme')
license=('GPL3')
url="https://github.com/vinceliuice/McMojave-circle"
source=("mcmojave-circle-icon-theme::git+${url}")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
  cd "${pkgname/-git/}" || exit
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "${pkgname/-git/}" || exit
  install -dm755 "${pkgdir}/usr/share/icons"
  sed -e "/^set -eo pipefail/d" -i install.sh
  sed -e "/^exit 1/d" -i install.sh
  ./install.sh  \
    --all \
    --dest "${pkgdir}/usr/share/icons"
}

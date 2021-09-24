# Maintainer: Supdrewin <supdrewin at outlook dot com>

pkgname=batterycm-switcher-git
pkgver=r22.c5e1610
pkgrel=1
pkgdesc="An advanced Ideapad Laptops conservation mode adjustment tool"
arch=('any')

url="https://github.com/supdrewin/batterycm-switcher"
license=('GPL3')

depends=('bash' 'coreutils' 'man-db' 'polkit' 'vim')
makedepends=('git' 'gzip' 'make' 'xz')
optdepends=(
  'acpid: For enable use function key to switch mode'
  'espeak: For enable show status using voice'
  'systemd: For optional function key backend service'
)

provides=('batterycm' 'batterycm-switcher' 'batterycm-charger')
conflicts=('batterycm' 'batterycm-switcher' 'batterycm-charger')

install=batterycm.install
_srcname=batterycm-switcher

source=("$_srcname::git+$url#branch=testing")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_srcname"
  make
}

package() {
  cd "$_srcname"
  make DESTDIR="$pkgdir" install
}

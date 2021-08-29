# Maintainer: Supdrewin <https://github.com/supdrewin>

pkgname=batterycm-switcher-preview
pkgver=null
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

pkgver() {
  echo -n git.r
  git clone -b testing $url.git

  cd "$_srcname"
  git describe --always
}

build() {
  cd "$_srcname"
  make
}

package() {
  cd "$_srcname"
  make DESTDIR="$pkgdir" install
}

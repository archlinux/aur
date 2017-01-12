# Maintainer: gh0st <gh0st@vivaldi.net>

pkgname=shift-git
pkgver=0.r69.97461e4
pkgrel=1
pkgdesc="A minimalistic approach to maximum control of your Transmission. (Web UI)"
arch=('any')
url="https://github.com/killemov/Shift/"
license=('GPL')
depends=('transmission-cli')
makedepends=('git')
provides=('shift')
conflicts=('kettu-git')
source=('git+https://github.com/killemov/Shift.git')
sha256sums=('SKIP')

pkgver() {
  cd Shift

  echo "0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cat << EOF >| shift.conf
[Service]
Environment=TRANSMISSION_WEB_HOME=/usr/share/webapps/shift
EOF
}

package() {
  install -Dm644 shift.conf "$pkgdir"/usr/lib/systemd/system/transmission.service.d/shift.conf
  install -dm755 "$pkgdir"/usr/share/webapps/shift

  cd Shift
  cp -a * "$pkgdir"/usr/share/webapps/shift
}

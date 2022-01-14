# Maintainer: Ivan Zenin <i.zenin@gmx.com>
# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>

pkgname=edfbrowser-git
pkgver=latest
pkgrel=1
pkgdesc="A free, opensource, multiplatform, universal viewer and toolbox intended for, but not limited to, timeseries storage files like EEG, EMG, ECG, BioImpedance, etc. (development version)"
arch=('i686' 'x86_64')
url="http://www.teuniz.net/edfbrowser/"
license=('GPL')
depends=('qt5-base')
provides=('edfbrowser')
conflicts=('edfbrowser')
source=('git+https://gitlab.com/Teuniz/EDFbrowser.git'
        'edfbrowser.desktop')
sha1sums=('SKIP'
          '3076f5b8ab0313edb7b20ca13214382914725f52')

pkgver() {
  cd "${srcdir}"/EDFbrowser
  ( set -o pipefail
    git describe --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}"/EDFbrowser
  qmake
  make
}

package() {
  cd "${srcdir}"/EDFbrowser

  install -dm755 "${pkgdir}"/usr/bin
  install -dm755 "${pkgdir}"/usr/share/applications
  install -dm755 "${pkgdir}"/usr/share/icons
  install -m755 -t "${pkgdir}"/usr/bin edfbrowser
  install -m644 -t "${pkgdir}"/usr/share/applications ../edfbrowser.desktop
}

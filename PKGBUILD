# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: Vinzenz Vietzke <vinz@archlinux.us>
# Contributor: Vinzenz Vietzke <vinz@archlinux.us>

pkgname=activitydiary
pkgver=0.2
pkgrel=5
pkgdesc="Analyse and manage all your recorded GPS-tracks"
arch=('i686' 'x86_64')
url="http://www.activitydiary.org"
license=('GPL')
depends=('qt4' 'qwt5')
source=(
  "http://tomstar.ath.cx/activitydiary/public/ad/${pkgname}-${pkgver}.tar.gz"
  'activitydiary.pro.patch'
)
sha256sums=(
  'a4df70a8a86daf724548659d192e0e87b76c284fdce2562cc6d80b4f2429f861'
  '248508e05845d533bdb3134ac9f66007c7e68736b4e71abcf877af3ee8e744c9'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # patch qwt-paths in activitydiary.pro
  patch "activitydiary.pro" "${srcdir}/activitydiary.pro.patch"
  # build
  rm -rf build
  mkdir build
  cd build
  qmake-qt4 ../activitydiary.pro
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make INSTALL_ROOT=${pkgdir} install
}

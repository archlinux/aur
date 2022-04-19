# Maintainer : maoxuner <maoxuner at 126 dot com>
# Maintainer : Sébastien Deligny <sebdeligny at gmail>

pkgname=thunar-shares-plugin
pkgver=0.3.1
pkgrel=1
epoch=1
pkgdesc="Thunar plugin to quickly share a folder using Samba without requiring root access"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/thunar-plugins/${pkgname}"
license=('GPL2' 'LGPL')
depends=('thunar>=1.7.0' 'samba')
makedepends=('xfce4-dev-tools')
install="${pkgname}.install"
source=(
  "https://git.xfce.org/thunar-plugins/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz"
  "shares.patch"
)
sha1sums=(
  "75498def2b21271d703ff9654d9e56cbe1b46f8c"
  "a78952a65e43f0e2eaceb6db959970faccaa3474"
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}"/shares.patch
  ./autogen.sh --prefix=/usr --enable-debug=no
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

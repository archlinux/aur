# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>

pkgname=xfce4-panel-profiles
pkgver=1.0.12
pkgrel=2
pkgdesc="Simple application to manage Xfce panel layouts"
arch=('any')
url="https://git.xfce.org/apps/xfce4-panel-profiles/about/"
license=('GPL3')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'python-gobject')
makedepends=('intltool')
conflicts=('xfpanel-switch')
replces=('xfpanel-switch')
source=("https://archive.xfce.org/src/apps/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2"
        'fix_check_desktop_fn.patch')
sha256sums=('246e459d2d2f3f524968440ed7fddb2a891567ebc05f10a800f7f5821b3452a7'
            '0f126a008693bf86a8606564cbdafeec50b580eff1a273f60cc4e67dc1830748')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -uNp2 -r- -i ../fix_check_desktop_fn.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --python=python
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}

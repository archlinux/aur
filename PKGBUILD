# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xfce4-clipman-plugin-passive
pkgver=1.2.6
pkgrel=2
pkgdesc="Clipman without buggy selection stealing"
arch=(i686 x86_64)
license=('GPL')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-clipman-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libunique' 'libxtst')
makedepends=('intltool')
replaces=('xfce4-clipman-plugin')
conflicts=('xfce4-clipman-plugin')
provides=('xfce4-clipman-plugin')
options=('!libtool')
source=(nosteal.patch http://archive.xfce.org/src/panel-plugins/xfce4-clipman-plugin/1.2/xfce4-clipman-plugin-${pkgver}.tar.bz2)

build() {
  cd "${srcdir}"/xfce4-clipman-plugin-${pkgver}
  patch -Np1 -i "${srcdir}"/nosteal.patch

  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static --enable-unique
  make
}

package() {
  cd "${srcdir}"/xfce4-clipman-plugin-${pkgver}
  make DESTDIR="${pkgdir}" install
}
md5sums=('13e31835071ea506fee684154975b2cf' 'f7f2440647493243cbd7787eaee92fcb')

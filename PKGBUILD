# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Kaos < gianlucaatlas_AT_gmail_DOT_com >

pkgname=xf86-input-synaptics-gesturesonly
_pkgname=xf86-input-synaptics
pkgver=1.9.1
pkgrel=1
pkgdesc="Synaptics driver for notebook touchpads"
arch=('i686' 'x86_64')
url="http://patchwork.freedesktop.org/patch/14393/"
license=('custom')
depends=('libxtst' 'mtdev')
makedepends=('pkgconfig' 'xorg-server' 'git' 'xorg-server-devel')
provides=('synaptics' 'xf86-input-synaptics')
conflicts=('synaptics')
groups=('xorg-input-drivers')
options=('!libtool' 'zipman')
source=("$_pkgname"::"git://anongit.freedesktop.org/xorg/driver/xf86-input-synaptics#tag=$_pkgname-$pkgver"
        '14393-gestures-only.patch')
md5sums=('SKIP'
         '8639335e76a1dd50f77ace9fc8fe0975')
sha256sums=('SKIP'
            'fb08b1b9a3f565e0559587e4dc9450c740279c727f57aff9d571e303c1911892')


prepare() {
  cd "$srcdir/$_pkgname"

  patch -p1 < $srcdir/14393-gestures-only.patch
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr --with-xorg-conf-dir=/etc/X11/xorg.conf.d
  make
}
package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

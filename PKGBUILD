#
# Maintainer: Ste74 <capitani74atgmaildotcom>
# Maintainer: Zavon <zavon at zavon .org>

pkgname=slingscold
pkgver=1.2.1
pkgrel=1
pkgdesc="A lighter launcher"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/slingscold/"
license=('GPL3')
depends=('libunique' 'libgee06' 'gnome-menus2' 'libwnck' 'gtk2' 'cairo')
makedepends=('cmake' 'vala')
source=("http://ppa.launchpad.net/noobslab/apps/ubuntu/pool/main/s/slingscold/slingscold_1.2.1.7t~NoobsLab.com.tar.gz"
        '0001-Add-missing-lm-dep.patch')
sha256sums=('363f8b9ac6a4a93b9703066dff0f25b39a45b46d6e856c90f4256e9a26dfd418'
            '6b1c97fe7863da5d7be000b3f139cc974ea86654c2b210be6eb1b1ac070a9a7c')

prepare() {
  cd "$srcdir"
  rm -rf build && mkdir build

  cd "$srcdir/slingscold_1.2.1"
  patch -p1 < "$srcdir"/0001-Add-missing-lm-dep.patch
}

build() {
  cd "$srcdir"/build
  cmake ../"slingscold_1.2.1" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}

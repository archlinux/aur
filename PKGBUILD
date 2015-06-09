# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>

pkgname=vala-git
pkgver=7085.9bcc61c
pkgrel=1
pkgdesc="Compiler for the GObject type system"
arch=(i686 x86_64)
url="http://live.gnome.org/Vala"
license=(LGPL)
depends=(glib2)
makedepends=(git libxslt)
provides=("vala=0.26.1")
conflicts=(vala vala-devel)
options=(!libtool)
source=('git+git://git.gnome.org/vala')
sha512sums=('SKIP')

pkgver() {
  cd vala
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd vala

  git describe --tag | sed 's/-.*//g' > .tarball-version
}

build() {
  cd vala

  ./autogen.sh --prefix=/usr --enable-vapigen
  make
}

package() {
  cd vala

  make DESTDIR="${pkgdir}/" install
}

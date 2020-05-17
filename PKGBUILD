# Maintainer: Igor <f2404@yandex.ru>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Pablo Lezaeta <prflr arro'a gmail puntocom> (I tryed)
# Contributor: jyantis <yantis@yantis.net>
# Contributor: Diego Principe <cdprincipeat gmaildot com>
# Contributor: Jan Jezek <honzin.jezek@gmail.com>
# Contributor: Berseker <berseker86 at gmail dot com>

_pkgname=exo
pkgname=${_pkgname}-git
pkgver=0.12.11+68+ga978d108
pkgrel=1
pkgdesc="Extensions to Xfce originally developed by os-cillation."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="https://gitlab.xfce.org/xfce/exo/"
groups=('xfce4-git')
provides=("exo=${pkgver}")
depends=('hicolor-icon-theme' 'libxfce4ui')
makedepends=('xfce4-dev-tools' 'git' 'pkgconfig' 'libnotify' 'perl-uri')
optdepends=('libnotify: enables notification support'
	'perl: enables mail-compose helper script')
conflicts=('exo')
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}.git")
options=('!libtool')
md5sums=('SKIP')
epoch=1

pkgver(){
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^exo-//;s/-/+/g"
#  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
  cd "${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var  \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR=$pkgdir install
}

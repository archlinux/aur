# Maintainer: melchips <truphemus dot francois at gmail dot com>
# Contributor: atie H. <atie.at.matrix@gmail.com>
# Contributor: L42y <423300@gmail.com>
# Contributor: gesh <gesh@gesh.uni.cx>

pkgname=sparkleshare-git
_gitname=SparkleShare
pkgver=2.0.beta.1.r5.g8c033d26
pkgrel=1
pkgdesc="An open-source clone of Dropbox, written in C-sharp"
arch=('i686' 'x86_64')
url="http://www.sparkleshare.org/"
license=('LGPL')
depends=('mono' 'gtk-sharp-3' 'intltool'
'webkit2-sharp' 'notify-sharp-3' 'desktop-file-utils' 'webkitgtk-sharp-git'
'soup-sharp' 'dbus-sharp')
makedepends=('git')
options=('!libtool')
provides=('sparkleshare')
conflicts=('sparkleshare')
source=("$_gitname"::'git+https://github.com/hbons/SparkleShare.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    # Use the unannotated tag of the last commit
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  msg2 "Starting make..."
  ./autogen.sh --prefix=/usr
  make || return 1
}

package() {
    cd ${srcdir}/${_gitname}
    make DESTDIR=${pkgdir} install || return 1

    install -m755 -d ${pkgdir}/usr/share/sparkleshare/html
    install -m755 -d ${pkgdir}/usr/share/sparkleshare/pixmaps
}

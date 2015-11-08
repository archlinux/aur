# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=lxsession-gtk3
_pkgname=lxsession
pkgver=0.5.2
pkgrel=4
pkgdesc='Lightweight X11 session manager (GTK+ 3 version)'
arch=('i686' 'x86_64')
url="http://lxde.org/"
license=('GPL2')
groups=('lxde-gtk3')
depends=('dbus-glib' 'gtk3' 'polkit')
makedepends=('intltool' 'docbook-xsl' 'vala')
conflicts=($_pkgname)
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz
        0001-Beautify-GtkBuilder-UI-file-of-lxpolkit-without-modi.patch
        0002-Some-fixes-for-GTK-3.patch
        0001-Fix-background-on-GTK-3.patch
        0001-Add-support-for-recent-GDM-versions.patch
        0001-Use-standard-icons.patch)
md5sums=('2957acccbf9ce37ef8205ec5424f8047'
         '9eb20e451a32f7754d41b611426947b4'
         '38324f7d527a3096f06015d75f1bb64d'
         '4271c2cbba3cbdbd861d3de7ff644bcf'
         'ccdf2187b08117ca72797d5f3e9e4e2b'
         '145f052c14879edf5581cde25509468d')

prepare() {
  cd $_pkgname-$pkgver

  # Some fixes for GTK+ 3
  patch -Np1 -i ../0001-Beautify-GtkBuilder-UI-file-of-lxpolkit-without-modi.patch
  patch -Np1 -i ../0002-Some-fixes-for-GTK-3.patch
  patch -Np1 -i ../0001-Fix-background-on-GTK-3.patch
  patch -Np1 -i ../0001-Add-support-for-recent-GDM-versions.patch
  patch -Np1 -i ../0001-Use-standard-icons.patch

  # Regenerate C sources from Vala code
  rm *.stamp
}

build() {
  cd $_pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr --enable-gtk3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install 
}

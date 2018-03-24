# maintainer: Mike Krüger <mikekrueger81[at]gmail.com>

pkgname=gnome-encfs-manager-bin
_pkgname=gnome-encfs-manager
pkgver=1.8.19
pkgrel=2
pkgdesc="An easy to use manager and mounter for encfs stashes"
arch=('x86_64')
replaces=('gnome-encfs-manager')
conflicts=('gnome-encfs-manager-bzr')
depends=('encfs' 'libgee06' 'gtk3' 'libsm' 'libgnome-keyring' 'libappindicator-gtk3')
makedepends=('binutils' 'tar')
url="https://launchpad.net/gencfsm"

source=("http://download.opensuse.org/repositories/home:/moritzmolch:/gencfsm/Debian_9.0/amd64/gnome-encfs-manager_${pkgver}_amd64.deb")
sha256sums=('7e8f782882d4f3d92667282913db5b3a126ce7d313a0ba651dbcbe4743e55f83')

prepare() {
    cd ${srcdir}
    ar vx gnome-encfs-manager_${pkgver}_amd64.deb
    tar -xf data.tar.xz
}
package(){
   install -d $pkgdir/usr/bin
   install -m755 ${srcdir}/usr/bin/${_pkgname} $pkgdir/usr/bin/

   install -d $pkgdir/usr/share
   install -d $pkgdir/usr/share/applications
   install -Dm644 ${srcdir}/usr/share/applications/${_pkgname}.desktop $pkgdir/usr/share/applications/

   install -d $pkgdir/usr/share/dbus-1/services/
   install -Dm644 ${srcdir}/usr/share/dbus-1/services/com.libertyzero.gnome-encfs-manager.service $pkgdir/usr/share/dbus-1/services/

   install -d $pkgdir/usr/share/glib-2.0/schemas/
   install -Dm644 ${srcdir}/usr/share/glib-2.0/schemas/com.libertyzero.gnome-encfs-manager.gschema.xml $pkgdir/usr/share/glib-2.0/schemas/ 

   install -d $pkgdir/usr/share/gnome-encfs-manager/
   mv ${srcdir}/usr/share/gnome-encfs-manager/* $pkgdir/usr/share/gnome-encfs-manager/

   install -d $pkgdir/usr/share/icons/
   mv ${srcdir}/usr/share/icons/* $pkgdir/usr/share/icons/

   install -d $pkgdir/usr/share/locale/
   mv ${srcdir}/usr/share/locale/* $pkgdir/usr/share/locale/
   
}

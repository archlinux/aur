# maintainer: Sergio Schneider <spsf64 at g m a i l . c o m>
# Former maintainer: Mike Krüger

pkgname=gnome-encfs-manager-bin
_pkgname=gnome-encfs-manager
pkgver=1.9.1157
pkgrel=1
pkgdesc="An easy to use manager and mounter for encfs stashes"
arch=('x86_64')
replaces=('gnome-encfs-manager')
conflicts=('gnome-encfs-manager-bzr')
depends=('encfs' 'libgee' 'gtk3' 'libsm' 'libgnome-keyring' 'libappindicator-gtk3')
makedepends=('binutils' 'tar')
url="https://launchpad.net/gencfsm"

#source=("http://download.opensuse.org/repositories/home:/moritzmolch:/gencfsm/Debian_9.0/amd64/gnome-encfs-manager_${pkgver}_amd64.deb")
#sha256sums=('7e8f782882d4f3d92667282913db5b3a126ce7d313a0ba651dbcbe4743e55f83')

source=("https://ppa.launchpadcontent.net/gencfsm/trunk/ubuntu/pool/main/g/gnome-encfs-manager/gnome-encfs-manager_1.9~1157~ubuntu20.04.1_amd64.deb")
sha256sums=('a8494ba3fec9b1109e948188ab1a4e86ab3e2bbfe97becbb0384724b4ea7eefb')

prepare() {

#   mv gnome-encfs-manager_1.9~ubuntu20.04.1_amd64.deb gnome-encfs-manager_1.9_amd64.deb
    mv gnome-encfs-manager_1.9~1157~ubuntu20.04.1_amd64.deb gnome-encfs-manager_1.9.1157_amd64.deb

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

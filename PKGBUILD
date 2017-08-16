# Maintainer: artemtech <sofyanartem@gmail.com>
# Credit: twa022 <twa022@gmail.com>

pkgname=manokwari
pkgver=1.0.13
pkgrel=3
pkgdesc="HTML5 desktop shell from BlankOn Projects"
arch=('i686' 'x86_64')
url="https://manokwari.blankonlinux.or.id"
license=('GPL3')
depends=('mutter' 'libunique3' 'gnome-session' 'glib2' 'gtk3' 'libwnck3' 'libgee' 'webkitgtk' 'gnome-menus' 'libnotify')
makedepends=('gnome-common' 'git' 'vala')
optdepends=('bromo-gtk-theme: Gtk theme optimized for Manokwari shell'
            'tebu-icon-theme: Official icon sets from BlankOn'
            'tebu-flat-icon-theme: flat version of tebu-icon from BlankOn'
            'gnome-screensaver: Lockscreen support'
            'gnome-control-center: System settings'
            'gnome-terminal: Run commands via dashboard')
source=("https://github.com/BlankOn/$pkgname/archive/$pkgver.tar.gz")
md5sums=('SKIP')

prepare(){
  cd ${srcdir}/${pkgname}-${pkgver}
  # Use gee-0.8 rather than gee-0.6
  sed -i 's/gee-1.0/gee-0.8/g' configure.ac
  # Fix documentations install dir
  sed -i 's:\(manokwaridocdir =\).*:\1 ${prefix}/share/doc/manokwari:' Makefile.am
}

build(){
  cd ${srcdir}/${pkgname}-${pkgver}
  ./autogen.sh
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
  cp -R system/{css/,fonts/,img/,js/,widget/,texture.jpg,texture.xcf} --target-directory=$pkgdir/usr/lib/manokwari/system/
  chmod +x $pkgdir/usr/bin/blankon-session
}

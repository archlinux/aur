# Maintainer: Antergos Developers <dev@antergos.com>

pkgname=lightdm-webkit2-greeter
pkgver=0.2.3
pkgrel=1
pkgdesc="A webkit2 greeter for LightDM"
arch=('i686' 'x86_64')
url="https://github.com/antergos/lightdm-webkit2-greeter"
license=('GPL3' 'LGPL3')
source=("${pkgname}-${pkgver}::git+https://github.com/antergos/${pkgname}.git")
groups=('system')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/antergos/lightdm-webkit2-greeter/archive/${pkgver}.tar.gz")
makedepends=('gnome-doc-utils' 'gobject-introspection' 'intltool' 'gnome-common' 'exo' 'git')
depends=('lightdm' 'webkit2gtk>=2.10' 'webkit2gtk<2.12' 'gtk-engines' 'gtk3>=3.18' 'gtk3<3.20' 'dbus-glib')
provides=('lightdm-webkit-greeter' 'lightdm-webkit-theme-antergos=2.2.4')
conflicts=('lightdm-webkit-greeter' 'lightdm-webkit-theme-antergos')
replaces=('lightdm-webkit-greeter' 'lightdm-webkit-theme-antergos<2.2.4')
options=(!libtool)
install=greeter.install
backup=("etc/lightdm/${pkgname}.conf")
sha256sums=('SKIP')

build() {
	cd $srcdir/${pkgname}-${pkgver}
	git submodule init && git submodule update
	LIBS+="-ljavascriptcoregtk-4.0" ./autogen.sh \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib/lightdm \
		--bindir=/usr/bin \
		--sbindir=/usr/bin
	
	make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install 
}

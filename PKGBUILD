# Maintainer: Pezcurrel <pezcurrel [at] insicuri.net>
# Contributor: Pezcurrel <pezcurrel [at] insicuri.net>
# Maintainer: Maxime Gauduin <alucrydarchlinux.org>
# Contributor: Padfoot <padfoot@exemail.com.au>

pkgname='lightdm-gtk-greeter-cancellable-autologin'
pkgver='2.0.9'
pkgrel='5'
epoch='1'
pkgdesc='GTK+ greeter for LightDM with cancellable autologin patch'
arch=('x86_64')
_repodir='lightdm-gtk-greeter-with-cancellable-autologin'
url="https://github.com/pezcurrel/${_repodir}"
license=('GPL-3.0-or-later')
depends=('gtk3' 'lightdm')
makedepends=('exo' 'git' 'gobject-introspection' 'intltool' 'xfce4-dev-tools')
_tag='lightdm-gtk-greeter-2.0.9-cancellable-autologin-2'
provides=('lightdm-gtk-greeter')
conflicts=('lightdm-gtk-greeter' 'lightdm-gtk-greeter-git')
backup=('etc/lightdm/lightdm-gtk-greeter.conf')
source=("git+${url}.git#tag=${_tag}")
sha256sums=('SKIP')

prepare() {
	cd ${_repodir}
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd ${_repodir}
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/lightdm \
		--sbindir=/usr/bin \
		--sysconfdir=/etc \
		--with-libxklavier \
		--enable-kill-on-sigterm \
		--disable-at-spi-command \
		--disable-indicator-services-command \
		--disable-libido \
		--disable-libindicator \
		--disable-static
	make
}

package() {
	make DESTDIR="${pkgdir}" -C ${_repodir} install
}

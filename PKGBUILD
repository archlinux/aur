# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: rilian-la-te <ria.freelander@gmail.com>
# Contributor: JoveYu <yushijun110@126.com>

pkgname=vala-panel
pkgver=0.5.0
pkgrel=1
pkgdesc="Gtk3 panel for compositing window managers"
url="https://gitlab.com/vala-panel-project/vala-panel"
arch=('i686' 'pentium4' 'x86_64')
license=('LGPL3')
depends=('gtk3' 'libwnck3' 'gtk-layer-shell')
makedepends=('meson' 'vala')
optdepends=('vala-panel-appmenu-valapanel: Global Menu'
			'vala-panel-sntray: SNI System tray'
			'vala-panel-applets-xembed: Old system tray'
			'vala-panel-applets-icontasks: Budgie tasklist'
			'vala-panel-genmon: GenMon applet')
source=("${pkgname}::git+https://gitlab.com/vala-panel-project/${pkgname}.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}
  git cherry-pick -n 52f40ce779cfa224266dd427cfe57afd83a28362
}

build() {
  meson build "${srcdir}/${pkgname}" --prefix=/usr --libdir=lib --libexecdir=lib -Dwnck=enabled -Dplatforms=x11,layer-shell
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}



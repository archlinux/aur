# Maintainer: rilian-la-te <ria.freelander@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=vala-panel
_cmakename=cmake-vala
pkgver=0.4.92
pkgrel=1
pkgdesc="Gtk3 panel for compositing window managers"
url="https://gitlab.com/vala-panel-project/vala-panel"
arch=('any')
license=('LGPL3')
depends=('gtk3' 'libwnck3')
makedepends=('cmake' 'vala')
optdepends=('vala-panel-appmenu-valapanel: Global Menu'
			'vala-panel-sntray: SNI System tray'
			'vala-panel-applets-xembed: Old system tray'
			'vala-panel-applets-icontasks: Budgie tasklist'
			'vala-panel-genmon: GenMon applet')
source=("${pkgname}::git+https://gitlab.com/vala-panel-project/${pkgname}.git#tag=${pkgver}"
        "git+https://gitlab.com/vala-panel-project/${_cmakename}.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "${srcdir}/${_cmakename}"
  cp -r . "${srcdir}/${pkgname}/cmake"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_WNCK=ON
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}



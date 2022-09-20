# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: rilian-la-te <ria.freelander@gmail.com>
# Contributor: JoveYu <yushijun110@126.com>

# shellcheck disable=SC2034
pkgname="vala-panel"
pkgver=0.5.0
pkgrel=1
pkgdesc="Gtk3 panel for compositing window managers"
url="https://gitlab.com/${pkgname}-project/${pkgname}"
arch=('i686' 'pentium4' 'x86_64')
license=('LGPL3')
depends=('gtk3' 'libwnck3' 'gtk-layer-shell')
makedepends=('git' 'meson' 'vala')
optdepends=("${pkgname}-appmenu-valapanel: Global Menu"
            "${pkgname}-sntray: SNI System tray"
            "${pkgname}-applets-xembed: Old system tray"
            "${pkgname}-applets-icontasks: Budgie tasklist"
            "${pkgname}-genmon: GenMon applet")
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname} || exit
  git cherry-pick -n 52f40ce779cfa224266dd427cfe57afd83a28362
}

# shellcheck disable=SC2154
build() {
  meson build "${srcdir}/${pkgname}" --prefix=/usr --libdir=lib --libexecdir=lib -Dwnck=enabled -Dplatforms=x11,layer-shell
  meson compile -C build
}

# shellcheck disable=SC2154
package() {
  DESTDIR="${pkgdir}" meson install -C build
}



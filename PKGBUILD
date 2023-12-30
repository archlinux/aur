# Maintainer: Christophe Noisel <cnoisel at proton.me>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: herb  <herb@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=planner
pkgver=0.14.92
pkgrel=1
pkgdesc='Project management application for GNOME'
arch=('x86_64')
license=('GPL')
url='https://wiki.gnome.org/Apps/Planner'
depends=('glib2>=2.56', # glib, gmodule, gobject
	'gtk3>=3.22', # gtk3, gail
	'libxml2>=2.6.27',
	'libxslt>=1.1.23', #libxslt, libexslt
	'libgda>=5.0') # database export feature is enabled by arch-meson
makedepends=('git' 'meson')
options=('!emptydirs')
source=("git+https://gitlab.gnome.org/World/planner.git#tag=$pkgver")
sha256sums=('SKIP')
install=planner.install

# https://wiki.archlinux.org/title/Meson_package_guidelines#Template

build() {
	# 'git clone' done in "./planner" directory :
	arch-meson planner build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}

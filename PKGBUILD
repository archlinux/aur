# Maintainer: Trayambak Rai <xtrayambak at disroot dot org>
pkgname=equinox-git
pkgver=0.1.8
pkgrel=1
epoch=
pkgdesc="An open-source runtime for Roblox on Linux"
arch=('i686' 'x86_64')
url="https://equinoxhq.github.io"
license=('MIT')
groups=()
depends=(
  'curl'
  'libx11'
  'libglvnd'
  'graphene'
  'libxkbcommon'
  'libxcursor'
  'cairo'
  'libadwaita'
  'gdk-pixbuf2'
  'harfbuzz'
  'libxext'
  'glib2'
  'glibc'
  'pango'
  'vulkan-icd-loader'
  'gtk4'
  'wayland'
  'lxc'
  'libgbinder'
  'pcre2'
  'dnsmasq'
)
makedepends=(
  'nim'
  'clang'
  'git'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('equinox::git+https://github.com/equinoxhq/equinox.git#branch=master')
sha256sums=('SKIP')

build() {
	cd equinox
	nimble build --define:release --define:speed --define:equinoxBin=/usr/bin/equinox
}

package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/share/icons
	mkdir -p $pkgdir/usr/share/icons/hicolor
	mkdir -p $pkgdir/usr/share/icons/hicolor/scalable
	mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps
	mkdir -p $pkgdir/usr/share/licenses
	mkdir -p $pkgdir/usr/share/licenses/$pkgname

	install -Dm755 "equinox/equinox" $pkgdir/usr/bin/equinox
	install -Dm755 "equinox/equinox_gui" $pkgdir/usr/bin/equinox_gui

	install -Dm644 "equinox/LICENSE" $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 "equinox/README.md" $pkgdir/usr/share/licenses/$pkgname/README.md

	install -Dm644 "equinox/src/gui/equinox.desktop" $pkgdir/usr/share/applications/equinox.desktop
	install -Dm644 "equinox/src/gui/equinox_shell.desktop" $pkgdir/usr/share/applications/equinox_shell.desktop

	install -Dm644 "equinox/assets/equinox.svg" $pkgdir/usr/share/icons/hicolor/scalable/apps/equinox.svg
}

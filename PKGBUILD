# Maintainer: Márcio <marciosr10@gmail.com>

pkgname=gnome-shell-40alfa
_pkgname=gnome-shell
pkgver=40.0+1+gbf6d668ca
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell"
url="https://gitlab.gnome.org/GNOME/gnome-shell"
arch=(x86_64)
license=(GPL2)
depends=(accountsservice gcr gjs js78 gnome-bluetooth upower gnome-session
		 gnome-settings-daemon sysprof gnome-themes-extra gtk4 libcanberra-pulse
		 libcroco libgdm  libsecret nm-connection-editor unzip gstreamer
		 libibus gnome-desktop bash-completion gnome-autoar
		 glib2 gsettings-desktop-schemas-git libgweather-git mutter-40alfa)
				
makedepends=(gtk-doc gnome-control-center evolution-data-server 
			 gobject-introspection git meson sassc asciidoc vulkan-headers)

optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
            
groups=(gnome)
provides=(gnome-shell)
conflicts=(gnome-shell)
options=(debug !strip)

source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git")

sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "$_pkgname" build -D gtk_doc=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}


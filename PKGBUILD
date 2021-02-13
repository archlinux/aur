# Maintainer: Márcio <marciosr10@gmail.com>

pkgname=gnome-shell-40alfa
_pkgname=gnome-shell
pkgver=40.1.20210208.2
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell"
url="https://gitlab.gnome.org/GNOME/gnome-shell"
arch=(x86_64)
license=(GPL2)
depends=(accountsservice gcr gjs js78 gnome-bluetooth upower gnome-session
				gnome-settings-daemon sysprof gnome-themes-extra
				gsettings-desktop-schemas-git gtk4 libcanberra-pulse libcroco
				libgdm libgweather-git libsecret mutter-40alfa nm-connection-editor
				unzip gstreamer libibus gnome-desktop bash-completion gnome-autoar glib2-git)
				
makedepends=(gtk-doc gnome-control-center evolution-data-server gobject-introspection git meson
             sassc asciidoc vulkan-headers)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
provides=(gnome-shell)
conflicts=(gnome-shell)

source=("https://gitlab.gnome.org/haecker-felix/gnome-shell-40-copr/uploads/3551d83ba16b5048dd62448989722061/gnome-shell.tar.xz")

sha256sums=('d02f52dffd86365e1d28bf8aa2694ea818d168324512b163fe68cf0df4bc9fec')


build() {
  arch-meson "$_pkgname" build -D gtk_doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}


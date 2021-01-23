# Maintainer: Márcio <marciosr10@gmail.com>

pkgname=gnome-shell-40alfa
_pkgname=gnome-shell
pkgver=40.1.20210122.0
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell"
url="https://gitlab.gnome.org/GNOME/gnome-shell"
arch=(x86_64)
license=(GPL2)
depends=(accountsservice gcr gjs js68 gnome-bluetooth upower gnome-session
				gnome-settings-daemon sysprof gnome-themes-extra
				gsettings-desktop-schemas-git gtk4 libcanberra-pulse libcroco
				libgdm libgweather-git libsecret mutter-git nm-connection-editor
				unzip gstreamer libibus gnome-desktop bash-completion gnome-autoar)
				
makedepends=(gtk-doc gnome-control-center evolution-data-server gobject-introspection git meson
             sassc asciidoc vulkan-headers)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
provides=(gnome-shell)
conflicts=(gnome-shell)

source=("https://gitlab.gnome.org/haecker-felix/gnome-shell-40-copr/uploads/63f5142f45fc8982ef6d6074bf705f44/gnome-shell.tar.xz")
sha256sums=('91d41fc19a5b0ae6aa9bdef1c2ec138cf4871087704797542e5d745e913c7382')


build() {
  arch-meson "$_pkgname" build -D gtk_doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

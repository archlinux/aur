pkgname=gnome-session-git
_pkgname=gnome-session
pkgver=3.34.2
pkgrel=1
pkgdesc="The GNOME Session Handler"
url="https://gitlab.gnome.org/GNOME/gnome-session"
arch=(x86_64)
license=(GPL)
depends=('systemd' 'dconf' 'gsettings-desktop-schemas' 'gtk3' 'gnome-desktop'
         'json-glib' 'libgl' 'libsm' 'libxtst' 'systemd')
makedepends=('mesa' 'gtk-doc' 'xtrans' 'git' 'python' 'xmlto' 'docbook-xsl' 'meson')
provides=('gnome-session')
conflicts=('gnome-session')
source=("git+https://gitlab.gnome.org/GNOME/gnome-session.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

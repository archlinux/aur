# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=gala
_author=elementary
pkgname=("${_gitname}-stable")
pkgver=3.2.0
pkgrel=1
pkgdesc="A window & compositing manager based on libmutter and designed by elementary for use with Pantheon"
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
groups=('pantheon-stable')
depends=('atk' 'bamf' 'cairo' 'gdk-pixbuf2' 'glib2' 'gnome-settings-daemon-elementary'
		 'gnome-desktop' 'granite' 'gsettings-desktop-schemas-ubuntu' 'gtk3' 'json-glib' 'libdrm'
		 'libgee' 'libgl' 
		 'mutter>=3.23.90-1' 'libx11' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
		 'libxi' 'libxrandr' 'libxtst' 'mesa' 'pango' 'plank' 'wayland'
  		 )
makedepends=('git' 'gnome-common' 'meson>=0.42.0-1' 'vala>=0.40.3-1')
provides=("${_gitname}" "${pkgname}" "libgala.so")
conflicts=("${_gitname}" "${_gitname}-git" "${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('137ceb10f9649defd30c27606fb63eb82c3622eb8aa45339747c135b03d723a8')

build() {
    cd "${_gitname}-${pkgver}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${_gitname}-${pkgver}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}


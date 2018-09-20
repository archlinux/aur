# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=cros-adapta
pkgname=${_pkgname}-gtk-theme-git
pkgver=r52.f4dee35
pkgrel=1
pkgdesc="Adapta crostini theme, the Chrome OS GTK+ theme"
url="https://chromium.googlesource.com/chromiumos/third_party/cros-adapta/"
arch=(any)
license=(GPL2)

provides=(${_pkgname}-gtk-theme)
conflicts=(${_pkgname}-gtk-theme)
makedepends=("autoconf"
             "automake"
             "inkscape>=0.91"
             "gdk-pixbuf2>=2.32.2"
             "glib2>=2.48.0"
             "libsass>=3.3"
             "libxml2"
             "pkgconf"
             "sassc>=3.3"
             "git")
depends=(gtk-engine-murrine
         gtk3)

source=("git+https://chromium.googlesource.com/chromiumos/third_party/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgname}
    yes | tools/extract_adapta.sh
}

package() {
    cd ${_pkgname}

    install -dm 755 "${pkgdir}"/usr/share/themes/cros-adapta
  
    cp -r gtk-2.0 "${pkgdir}"/usr/share/themes/cros-adapta/
    cp -r gtk-3.0 "${pkgdir}"/usr/share/themes/cros-adapta/
    cp -r gtk-3.22 "${pkgdir}"/usr/share/themes/cros-adapta/
    cp index.theme "${pkgdir}"/usr/share/themes/cros-adapta/
}

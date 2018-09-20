# Maintainer: LinArcx <linarcx@gmail.com>

pkgname=gnome-shell-extension-topicons-plus-huttli-git
pkgver=v19.r73.gf9f2ba0
pkgrel=1
pkgdesc="Moves legacy tray icons to the top panel(Huttli Fokr)"
arch=('any')
url="https://github.com/huttli/TopIcons-plus"
license=('GPL2')
depends=('gnome-shell')
source=("${pkgname}::git+https://github.com/huttli/TopIcons-plus.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  _uuid='TopIcons@huttli'
  
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm644 "schemas/org.gnome.shell.extensions.topicons.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"

  cp -af * "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}
# Maintainer: Tom Wagner <tom dot a dot wagner at protonmail dot com>
# Contributor: smcdougall <simon at sjmcdougall dot com>

pkgname=gnome-shell-extension-multi-monitors-add-on-git
pkgver=r82.d72eb2d
pkgrel=1
pkgdesc="Updated for Gnome 3.32. Adds panels and thumbnails for additional monitors. Settings changes are applied in dynamic fashion, no restart needed."
arch=('any')
url="https://github.com/spin83/multi-monitors-add-on"
source=("${pkgname}::git+https://github.com/spin83/multi-monitors-add-on.git#branch=master")
md5sums=(SKIP)
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
groups=('gnome-shell-extensions')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    uuid="multi-monitors-add-on@spin83"
    cd "${srcdir}/${pkgname}/"

    install -Dm644 "${uuid}/schemas/org.gnome.shell.extensions.multi-monitors-add-on.gschema.xml" \
      "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.multi-monitors-add-on.gschema.xml"

    install -dm644 "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/"
  
    cp -a "${uuid}/" "${pkgdir}/usr/share/gnome-shell/extensions/"
    
    rm -rf "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/schemas"
}


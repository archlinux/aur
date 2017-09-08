#Maintainer: smcdougall <simon at sjmcdougall dot com>

pkgname=gnome-shell-extension-multi-monitors-add-on-git
pkgver=20170908
pkgrel=1
pkgdesc="Extension inspired by https://github.com/darkxst/multiple-monitor-panels and rewritten from scratch for gnome-shell version 3.10.4. Adds panels and thumbnails for additional monitors. Settings changes are applied in dynamic fashion, no restart needed."
arch=('any')
url="https://github.com/spin83/multi-monitors-add-on"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
groups=('gnome-shell-extensions')

_gitroot="git://github.com/spin83/multi-monitors-add-on.git"
_gitname="multi-monitors-add-on"

build() {
    cd "${srcdir}"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
}

package() {
    uuid="multi-monitors-add-on@spin83"
    cd "${srcdir}/${_gitname}"

    install -Dm644 "${uuid}/schemas/org.gnome.shell.extensions.multi-monitors-add-on.gschema.xml" \
      "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.multi-monitors-add-on.gschema.xml"

    install -dm644 "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/"
  
    cp -a "${uuid}/" "${pkgdir}/usr/share/gnome-shell/extensions/"
    
    rm -rf "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/schemas"

}


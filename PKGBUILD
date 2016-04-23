#Maintainer: smcdougall <smcdougall.mot at gmail dot com>

pkgname=gnome-shell-extension-multi-monitors-add-on-git
pkgver=20160423
pkgrel=1
pkgdesc="Extension inspired by https://github.com/darkxst/multiple-monitor-panels and rewritten from scratch for gnome-shell version 3.10.4. Adds panels and thumbnails for additional monitors. Settings changes are applied in dynamic fashion, no restart needed."
arch=('any')
url="https://github.com/spin83/multi-monitors-add-on"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
groups=('gnome-shell-extensions')
#install=multi-monitors-add-on.install

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
    install -Dm644 "${uuid}/metadata.json" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/metadata.json"
    install -m644 "${uuid}/extension.js" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/extension.js"
    install -m644 "${uuid}/convenience.js" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/convenience.js"
    install -m644 "${uuid}/prefs.js" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/prefs.js"
    install -m644 "${uuid}/indicator.js" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/indicator.js"
    install -m644 "${uuid}/mmlayout.js" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/mmlayout.js"
    install -m644 "${uuid}/mmoverview.js" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/mmoverview.js"
    install -m644 "${uuid}/mmpanel.js" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/mmpanel.js"
    install -m644 "${uuid}/multi-monitors-add-on.pot" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/multi-monitors-add-on.pot"
    install -m644 "${uuid}/stylesheet.css" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/stylesheet.css"

    install -Dm644 "${uuid}/icons/multi-monitors-l-symbolic.svg" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/icons/multi-monitors-l-symbolic.svg"
    install -m644 "${uuid}/icons/multi-monitors-r-symbolic.svg" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/icons/multi-monitors-r-symbolic.svg"

    install -Dm644 "${uuid}/locale/de/LC_MESSAGES/multi-monitors-add-on.mo" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/locale/de/LC_MESSAGES/multi-monitors-add-on.mo"
    install -m644 "${uuid}/locale/de/LC_MESSAGES/multi-monitors-add-on.po" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/locale/de/LC_MESSAGES/multi-monitors-add-on.po"

    install -Dm644 "${uuid}/schemas/org.gnome.shell.extensions.multi-monitors-add-on.gschema.xml" \
      "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.multi-monitors-add-on.gschema.xml"
}


# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=backslash-app
_basename=backslash
pkgname=${_basename}
pkgver=0.7.0
pkgrel=2
pkgdesc="A fast, extensible launcher for Linux"

license=('MIT')
arch=('x86_64' 'aarch64')
url="https://github.com/backslash-app/backslash"

provides=("${_basename}")

makedepends=('cargo' 'python' 'deno')
depends=('electron' 'nodejs' 'python' 'glibc' 'libgcc' 'gtk4' 'glib2' 'git' 'python' 'gdk-pixbuf2' 'pango' 'graphene' 'hicolor-icon-theme')
optdepends=('bubblewrap: Sandbox for non-TypeScript extensions'
            'gtk4-layer-shell: Overlay on wlroots compositors'
            'wl-clipboard: Clipboard history on Wayland'
            'libsecret: Keyring for extension secrets'
            'wmctrl: Window switcher on X11'
            'fd: Faster file search')

options=('!strip' '!debug')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('aae2a7da83ba31871f4517e218924939fc648f838b088ea1e97344484045c3f3')

build() {
    cd "${pkgname}-${pkgver}"

    make all
}

package() {
    cd "${pkgname}-${pkgver}"

    make DESTDIR=${pkgdir} PREFIX="/usr" install

    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

#     # Install the app
#     install -d "${pkgdir}/usr/lib/${_basename}"
#     cp -r out/* "${pkgdir}/usr/lib/${_basename}"
#     cp -r node_modules "${pkgdir}/usr/lib/${_basename}"
#
#     # Create a launcher script
#     install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_basename}" <<EOF
# #!/usr/bin/sh
#
# exec electron /usr/lib/${_basename}/main/index.js
# EOF
#
#     install -Dm644 "resources/icon.png" "${pkgdir}/usr/share/pixmaps/${_basename}.png"
}

# Maintainer: j.r <j.r@jugendhacker.de>
# Contributor: Jugal Gala <jugal.gala@sakec.ac.in>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-topicons-plus
pkgver=27
pkgrel=5
pkgdesc="Moves legacy tray icons to the top panel"
arch=('any')
url="https://github.com/phocean/TopIcons-plus"
license=('GPL2')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/phocean/TopIcons-plus/archive/${pkgver}.tar.gz"
        "0001-fix-compatibility-with-gnome40.patch"
        "0002-Declare-compatibility-with-GNOME-Shell-41.patch"
        "0003-Declare-GNOME-Shell-42-compatibility.patch")
sha256sums=('51c94aa52dd19e9f3740fee9580e47961414d7aec63dd588cb9c067cef8f4ad8'
            'e3ed60fd7d9830ac53cf34adee24c26fab1092660705d079bbb15e15a82b6381'
            'e4106d408a90af0d7c633cce394c276d35e2a69111758ad3229b42f8e19e53b8'
            '65b6970d4aadfcfce256e4830fde711a5aad3fd328ce9cb42e5b7457047c866f')

prepare() {
  cd "${srcdir}/TopIcons-plus-${pkgver}"

  patch -p1 -i ${srcdir}/0001-fix-compatibility-with-gnome40.patch
  patch -p1 -i ${srcdir}/0002-Declare-compatibility-with-GNOME-Shell-41.patch
  patch -p1 -i ${srcdir}/0003-Declare-GNOME-Shell-42-compatibility.patch
}

build(){
  cd "${srcdir}/TopIcons-plus-${pkgver}"

  make build
}

package() {
  cd "${srcdir}/TopIcons-plus-${pkgver}"

  make install INSTALL_PATH=${pkgdir}/usr/share/gnome-shell/extensions

  install -Dm644 "schemas/org.gnome.shell.extensions.topicons.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"
}

# vim:set ts=2 sw=2 et:

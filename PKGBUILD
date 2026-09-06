# Maintainer: JR Lanteigne <root at dnim dot dev>
# SPDX-FileCopyrightText: JR Lanteigne <root@dnim.dev>
# SPDX-License-Identifier: GPL-3.0-or-later

# pkgver and the checksums below are set from the git tag by the `aur` job
# in .github/workflows/release.yml, which is what publishes this. The values
# committed here are the last published ones, kept so the file still builds
# by hand.
pkgname=sharkfin-keyboard-bin
_pkgname=sharkfin
pkgver=0.7.2
pkgrel=1
pkgdesc='Configurator for Attack Shark and other ROYUAN keyboards'
arch=('x86_64')
url='https://github.com/dniminenn/sharkfin'
license=('GPL-3.0-or-later')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libgcc'
         'libsoup3' 'systemd-libs' 'webkit2gtk-4.1')
provides=('sharkfin-keyboard')
# The AUR package named sharkfin is an unrelated project that also installs
# /usr/bin/sharkfin.
conflicts=('sharkfin-keyboard' 'sharkfin')
# The .deb carries no debug info, so a debug package would be an empty
# directory plus a dangling symlink. Letting makepkg strip the binary as usual
# is what keeps namcap quiet; !strip would trade one warning for another.
options=('!debug')
source_x86_64=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb")
b2sums_x86_64=('eb403d0147bb723436d4d773ed56aac050c0bf842005244946ff1ecffc27d8b54b4c8f3c3217d6e2abd8dc9c5cd13925060cd20065ce1f73928ac8c39810a043')

package() {
  bsdtar -O -xf "${_pkgname}_${pkgver}_amd64.deb" data.tar.gz \
    | bsdtar -xzf - -C "$pkgdir" usr
}

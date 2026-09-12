# Maintainer: JR Lanteigne <root at dnim dot dev>
# SPDX-FileCopyrightText: JR Lanteigne <root@dnim.dev>
# SPDX-License-Identifier: GPL-3.0-or-later

# pkgver and the checksums below are set from the git tag by the `aur` job
# in .github/workflows/release.yml, which is what publishes this. The values
# committed here are the last published ones, kept so the file still builds
# by hand.
pkgname=sharkfin-keyboard-bin
_pkgname=sharkfin
pkgver=0.7.11
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
b2sums_x86_64=('74db86a1a4e40ac1a2a1acd459a9984574d80c33a21115d523d098fd4b8e7c499f60df8328001ce39d897578b5a25b1e535487e1e1a08575c35401f152f37588')

package() {
  bsdtar -O -xf "${_pkgname}_${pkgver}_amd64.deb" data.tar.gz \
    | bsdtar -xzf - -C "$pkgdir" usr
}

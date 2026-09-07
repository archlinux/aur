# Maintainer: JR Lanteigne <root at dnim dot dev>
# SPDX-FileCopyrightText: JR Lanteigne <root@dnim.dev>
# SPDX-License-Identifier: GPL-3.0-or-later

# pkgver and the checksums below are set from the git tag by the `aur` job
# in .github/workflows/release.yml, which is what publishes this. The values
# committed here are the last published ones, kept so the file still builds
# by hand.
pkgname=sharkfin-keyboard-bin
_pkgname=sharkfin
pkgver=0.7.5
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
b2sums_x86_64=('8d059a64a7effb6fc0d4ff9388019a36974346a693099005cc90e9a359688c85bd841ae861e0f2aed9fe58500ed8c2554bcdd489e3a50a64d80549fc32ba0bdd')

package() {
  bsdtar -O -xf "${_pkgname}_${pkgver}_amd64.deb" data.tar.gz \
    | bsdtar -xzf - -C "$pkgdir" usr
}

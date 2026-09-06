# Maintainer: JR Lanteigne <root at dnim dot dev>
# SPDX-FileCopyrightText: JR Lanteigne <root@dnim.dev>
# SPDX-License-Identifier: GPL-3.0-or-later

# pkgver and the checksums below are set from the git tag by the `aur` job
# in .github/workflows/release.yml, which is what publishes this. The values
# committed here are the last published ones, kept so the file still builds
# by hand.
pkgname=sharkfin-keyboard-bin
_pkgname=sharkfin
pkgver=0.7.1
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
b2sums_x86_64=('38aeef1b02a5cb3cc40c99de4df803f7557edcbcb5cb661637dfe046223c4eae81cf8b86f37fb599168940c018452742a51a0a3676b944164d6f0b17bec40cc5')

package() {
  bsdtar -O -xf "${_pkgname}_${pkgver}_amd64.deb" data.tar.gz \
    | bsdtar -xzf - -C "$pkgdir" usr
}

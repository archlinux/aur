# Maintainer: JR Lanteigne <root at dnim dot dev>
# SPDX-FileCopyrightText: JR Lanteigne <root@dnim.dev>
# SPDX-License-Identifier: GPL-3.0-or-later

# pkgver and the checksums below are set from the git tag by the `aur` job
# in .github/workflows/release.yml, which is what publishes this. The values
# committed here are the last published ones, kept so the file still builds
# by hand.
pkgname=sharkfin-keyboard-bin
_pkgname=sharkfin
pkgver=0.9.0
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
b2sums_x86_64=('43943815b1d93a9d2ab42bffc466bcddf3c87a41fa4e1cd2147e9d2cc56aa3f487e939a8e910cab4013bb1e379a3cd00e170da8e4a55e6480c394f57d05973a2')

package() {
  bsdtar -O -xf "${_pkgname}_${pkgver}_amd64.deb" data.tar.gz \
    | bsdtar -xzf - -C "$pkgdir" usr
}

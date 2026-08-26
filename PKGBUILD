# SPDX-License-Identifier: 0BSD
# Maintainer: Joel Tony <github@jaytau.com>

pkgname=rowboat-bin
pkgver=0.8.9
pkgrel=1
pkgdesc='AI coworker with memory'
arch=('x86_64')
url='https://www.rowboatlabs.com/'
license=('Apache-2.0')
provides=("rowboat=${pkgver}")
conflicts=('rowboat')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2'
  'gtk3' 'libcups' 'libdrm' 'libnotify' 'libpulse' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
  'libxrandr' 'libxt' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs'
  'xdg-utils'
)
options=('!debug' '!strip')
source=("rowboat-linux_${pkgver}_amd64.deb::https://github.com/rowboatlabs/rowboat/releases/download/v${pkgver}/rowboat-linux_${pkgver}_amd64.deb")
sha256sums=('629747f6109a2bd56d8a76dd3478cf3482ffb0899f9f79c6d534de1ae0fb7187')
noextract=("rowboat-linux_${pkgver}_amd64.deb")

package() {
  bsdtar -xOf "$srcdir/rowboat-linux_${pkgver}_amd64.deb" data.tar.zst |
    bsdtar --no-same-owner -xf - -C "$pkgdir"
  rm -rf "$pkgdir/usr/share/lintian"
  chmod 4755 "$pkgdir/usr/lib/rowboat-linux/chrome-sandbox"
  ln -s rowboat-linux "$pkgdir/usr/bin/rowboat"
}

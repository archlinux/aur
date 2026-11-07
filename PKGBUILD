# Maintainer: Darkstardevx <dev@cybercoretech.net>
#
# AUR prebuilt package for DWCode: same files as `dwcode`, no compiler or npm
# toolchain needed. Canonical copy is packaging/aur/dwcode-bin/PKGBUILD in the
# upstream repo; tools/aur-release.sh bumps it alongside the source package.
#
# The asset is a plain usr/ tarball repacked from an Arch package built on
# Arch against Arch's own qt6-webengine — never a bundle of foreign Qt libs,
# which would break silently at runtime.
#
# provides + conflicts (never `replaces`): both packages install
# /usr/bin/dwcode, so exactly one of them may be present, and a dependant
# asking for `dwcode` resolves to whichever is installed. `replaces` would let
# a binary install silently take over somebody's source build.
pkgname=dwcode-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Keyboard-first Cybercore desktop editor (prebuilt binary)"
arch=('x86_64')
url="https://github.com/cybercoretech/dwcode"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-webchannel' 'qt6-webengine' 'hicolor-icon-theme')
provides=('dwcode')
conflicts=('dwcode')
options=('!debug' '!strip')
source=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/dwcode-$pkgver-x86_64.tar.gz")
sha256sums=('22dbdfcb17d9306d3570b584b090b674a2de3fbd29c8936ffb9af98a75d5415f')

package() {
  # The tarball root is usr/, produced by packaging/aur/make-bin-tarball.sh
  # from the package() tree of an Arch build.
  tar -xf "$srcdir/$pkgname-$pkgver-x86_64.tar.gz" -C "$pkgdir"
}

# Maintainer:
# Contributor: Marcel <aur-feedback [ät] marehr.dialup.fu-berlin.de>

: ${_pkgver:=915934::10.8.0-2026-03-15}

_pkgname="intel-sde"
pkgname="$_pkgname"
pkgver=$(sed -E -e 's&^.*::&&;s&-.*&&' <<< ${_pkgver:?})
pkgrel=1
pkgdesc="Intel Software Development Emulator"
url="https://software.intel.com/en-us/articles/intel-software-development-emulator/"
license=('LicenseRef-Intel-Simplified')
arch=('x86_64')

depends=(
  'glibc'
)
optdepends=(
  'bash'
  'python'
  'python-distro'
)

provides=("intel-xed")
conflicts=("intel-xed")

options=('!debug' '!strip')

_pkgsrc="sde-external-${_pkgver##*::}-lin"
_pkgext="tar.xz"
source=("https://downloadmirror.intel.com/${_pkgver%%::*}/$_pkgsrc.$_pkgext")
sha256sums=('50b320cd226acef7a491f5b321fc1be3c3c7984f9e27a456e64894b5b0979dd3')

package() {
  mkdir -pm755 "$pkgdir/opt/$_pkgname"
  mv "$_pkgsrc"/* "$pkgdir/opt/$_pkgname/"

  mkdir -pm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/opt/$_pkgname/sde64" "$pkgdir/usr/bin/intel-sde"
  ln -srf "$pkgdir/opt/$_pkgname/xed64" "$pkgdir/usr/bin/intel-xed"

  mkdir -pm755 "$pkgdir/usr/share/licenses"
  ln -srf "$pkgdir/opt/$_pkgname/Licenses" "$pkgdir/usr/share/licenses/$pkgname"
}

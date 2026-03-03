# Maintainer:
# Contributor: Marcel <aur-feedback [ät] marehr.dialup.fu-berlin.de>

: ${_pkgver:=913594::10.7.0-2026-02-18}

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
sha256sums=('ca3d4086de4acb3faedf9f57b541c6936b7d5e19ae2bf763b6ea933573a0a217')

package() {
  install -dm755 "$pkgdir/opt/$_pkgname"
  mv "$_pkgsrc"/* "$pkgdir/opt/$_pkgname/"

  install -dm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/opt/$_pkgname/sde64" "$pkgdir/usr/bin/intel-sde"
  ln -srf "$pkgdir/opt/$_pkgname/xed64" "$pkgdir/usr/bin/intel-xed"

  install -dm755 "$pkgdir/usr/share/licenses"
  ln -srf "$pkgdir/opt/$_pkgname/Licenses" "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer:
# Contributor: Marcel <aur-feedback [ät] marehr.dialup.fu-berlin.de>

: ${_pkgver:=924984::10.13.1-2026-07-28}

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
sha256sums=('94e97d623fec54385686e1e7ba65ebc9941748c05ee451423948334892bf2b50')

package() {
  mkdir -pm755 "$pkgdir/opt/$_pkgname"
  mv "$_pkgsrc"/* "$pkgdir/opt/$_pkgname/"

  mkdir -pm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/opt/$_pkgname/sde64" "$pkgdir/usr/bin/intel-sde"
  ln -srf "$pkgdir/opt/$_pkgname/xed64" "$pkgdir/usr/bin/intel-xed"

  mkdir -pm755 "$pkgdir/usr/share/licenses"
  ln -srf "$pkgdir/opt/$_pkgname/Licenses" "$pkgdir/usr/share/licenses/$pkgname"
}

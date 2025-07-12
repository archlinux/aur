# Maintainer:
# Contributor: Marcel <aur-feedback [ät] marehr.dialup.fu-berlin.de>

: ${_pkgver:=859732::9.58.0-2025-06-16}
: ${_chksum:=f849acecad4c9b108259c643b2688fd65c35723cd23368abe5dd64b917cc18c0}

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
  'lib32-gcc-libs'
  'lib32-glibc'
  'python'
  'python-distro'
)

provides=("intel-xed")
conflicts=("intel-xed")

options=('!debug' '!strip')

_pkgsrc="sde-external-${_pkgver##*::}-lin"
_pkgext="tar.xz"
source=("https://downloadmirror.intel.com/${_pkgver%%::*}/$_pkgsrc.$_pkgext")
sha256sums=("${_chksum:-SKIP}")

package() {
  install -dm755 "$pkgdir/opt/$_pkgname"
  mv "$_pkgsrc"/* "$pkgdir/opt/$_pkgname/"

  install -dm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/opt/$_pkgname/sde64" "$pkgdir/usr/bin/intel-sde"
  ln -srf "$pkgdir/opt/$_pkgname/xed64" "$pkgdir/usr/bin/intel-xed"

  install -dm755 "$pkgdir/usr/share/licenses"
  ln -srf "$pkgdir/opt/$_pkgname/Licenses" "$pkgdir/usr/share/licenses/$pkgname"
}

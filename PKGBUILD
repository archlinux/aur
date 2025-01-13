# Maintainer:
# Contributor: Marcel <aur-feedback [ät] marehr.dialup.fu-berlin.de>

: ${_pkgver:=9.48.0-2024-11-25}

_pkgname="intel-sde"
pkgname="$_pkgname"
pkgver=${_pkgver%%-*}
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
  'lib32-glibc'
  'python'
)

provides=("intelxed")
conflicts=("intelxed")

options=('!debug' '!strip')

_pkgsrc="sde-external-$_pkgver-lin"
_pkgext="tar.xz"
source=("https://downloadmirror.intel.com/843185/$_pkgsrc.$_pkgext")
sha256sums=("3173d2a5369e3385226b488d8b75403951bc14af601435fe707d9f83e0b533e6")

package() {
  install -dm755 "$pkgdir/opt/$_pkgname"
  mv "$_pkgsrc"/* "$pkgdir/opt/$_pkgname/"

  install -dm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/opt/$_pkgname/sde64" "$pkgdir/usr/bin/intel-sde"
  ln -srf "$pkgdir/opt/$_pkgname/xed64" "$pkgdir/usr/bin/intel-xed"

  install -dm755 "$pkgdir/usr/share/licenses"
  ln -srf "$pkgdir/opt/$_pkgname/Licenses" "$pkgdir/usr/share/licenses/$pkgname"
}

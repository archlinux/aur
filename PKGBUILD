# Maintainer:
# Contributor: Marcel <aur-feedback [ät] marehr.dialup.fu-berlin.de>

: ${_pkgver:=9.53.0-2025-03-16}
: ${_dl_dir:=850782}

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
source=("https://downloadmirror.intel.com/$_dl_dir/$_pkgsrc.$_pkgext")
sha256sums=('f55138df53378198e8c0a89598351cdb3c5e7f8819e63e472b0bc179afaad34c')

package() {
  install -dm755 "$pkgdir/opt/$_pkgname"
  mv "$_pkgsrc"/* "$pkgdir/opt/$_pkgname/"

  install -dm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/opt/$_pkgname/sde64" "$pkgdir/usr/bin/intel-sde"
  ln -srf "$pkgdir/opt/$_pkgname/xed64" "$pkgdir/usr/bin/intel-xed"

  install -dm755 "$pkgdir/usr/share/licenses"
  ln -srf "$pkgdir/opt/$_pkgname/Licenses" "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: Marcel <aur-feedback [ät] marehr.dialup.fu-berlin.de>

_pkgname='sde'
pkgname='intel-sde'
_pkgver="8.69.1-2021-07-18-lin"
pkgver=${_pkgver%%-*} # strip everything after first '-'
pkgrel='1'
pkgdesc='Intel Software Development Emulator'
arch=('x86_64')
url='https://software.intel.com/en-us/articles/intel-software-development-emulator/'
license=('custom')
depends=('lib32-glibc')
makedepends=()
optdepends=()

_source="${_pkgname}-external-${_pkgver}.tar.bz2"
source=(
  "https://software.intel.com/content/dam/develop/external/us/en/documents/downloads/${_source}")
sha256sums=(
  "e41ab2e72e61a10b998f77ccbc30f7262fe5d8715f8da919144ce22380338d18")

package() {
  cd "${srcdir}/${_pkgname}-external-${_pkgver}"

  # fix permissions: 8.59 shipped with 750 we want 755
  chmod -R a+r .
  chmod -R o+X .

  mkdir -p "$pkgdir"/usr/{bin,share/$_pkgname/,share/licenses}

  cp -r * "$pkgdir"/usr/share/$_pkgname/
  ln -s /usr/share/$_pkgname/sde "$pkgdir"/usr/bin/sde
  ln -s /usr/share/$_pkgname/sde64 "$pkgdir"/usr/bin/sde64

  # symlink licenses
  ln -s /usr/share/$_pkgname/Licenses "$pkgdir"/usr/share/licenses/$_pkgname
}

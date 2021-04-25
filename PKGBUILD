# Maintainer: Marcel <aur-feedback [ät] marehr.dialup.fu-berlin.de>

_pkgname='sde'
pkgname='intel-sde'
_pkgver="8.63.0-2021-01-18-lin"
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
  "2cec12b4751cb850e52c9d9874bbc2365edef7c35db808f79abfd22db9cd46ea")

package() {
  cd "${srcdir}/${_pkgname}-external-${_pkgver}"

  # fix permissions: 8.59 shipped with 750 we want 755
  chmod -R a+r .
  chmod -R o+X .

  mkdir -p "$pkgdir"/usr/{bin,share/$_pkgname/}

  cp -r * "$pkgdir"/usr/share/$_pkgname/
  ln -s /usr/share/$_pkgname/sde "$pkgdir"/usr/bin/sde
  ln -s /usr/share/$_pkgname/sde64 "$pkgdir"/usr/bin/sde64

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}

# Maintainer: Marcel <aur-feedback [ät] marehr.dialup.fu-berlin.de>

_pkgname='sde'
pkgname='intel-sde'
_pkgver="8.49.0-2020-03-17-lin"
pkgver='8.49.0'
pkgrel='1'
pkgdesc='Intel Software Development Emulator'
arch=('x86_64')
url='https://software.intel.com/en-us/articles/intel-software-development-emulator/'
license=('custom')
depends=('python' 'lib32-glibc')
makedepends=('python-mechanicalsoup')
optdepends=()

_downloader=intel-sde-downloader.py
DLAGENTS+=("intel-http-accept::/usr/bin/python ./${_downloader}")


_source="${_pkgname}-external-${_pkgver}.tar.bz2"
source=(
  "https://raw.githubusercontent.com/marehr/intel-sde-downloader/8f5aa99e0809237b8d006ae8f12b7c87ea5190b3/${_downloader}"
  "intel-http-accept://${_source}")
sha256sums=(
  "df9b785b44046421644839015de794a8f2ea84605062ff687610925d0947efb3"
  "ed426d46f5b74a803c740499b8166da32b58d20259146ee05a9987091f94d8e0")

package() {
  cd "${srcdir}/${_pkgname}-external-${_pkgver}"

  mkdir -p "$pkgdir"/usr/{bin,share/$_pkgname/}

  cp -r * "$pkgdir"/usr/share/$_pkgname/
  ln -s /usr/share/$_pkgname/sde "$pkgdir"/usr/bin/sde
  ln -s /usr/share/$_pkgname/sde64 "$pkgdir"/usr/bin/sde64

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}

# Maintainer: Marcel <aur-feedback [ät] marehr.dialup.fu-berlin.de>

_pkgname='sde'
pkgname='intel-sde'
_pkgver="8.12.0-2017-10-23-lin"
pkgver='8.12.0'
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
  "https://raw.githubusercontent.com/marehr/intel-sde-downloader/7041211c0e19c3b1594ab5d78dfd0f9f39f15123/${_downloader}"
  "intel-http-accept://${_source}")
sha256sums=(
  "42fb1c255fe6e161a69f1786c3790a0d4680bb9b2693b5a3b2c62788d9e72194"
  "6d93663f98a34296c11cf2779756dda15e33ddd13b098a327642c654df0ab9a7")

package() {
  cd "${srcdir}/${_pkgname}-external-${_pkgver}"

  mkdir -p "$pkgdir"/usr/{bin,share/$_pkgname/}

  cp -r * "$pkgdir"/usr/share/$_pkgname/
  ln -s /usr/share/$_pkgname/sde "$pkgdir"/usr/bin/sde
  ln -s /usr/share/$_pkgname/sde64 "$pkgdir"/usr/bin/sde64

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}

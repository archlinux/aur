# Maintainer: Joan Figueras <ffigue at gmail dot com>

pkgname=abrowser-bin
_pkgname=${pkgname%-*}
pkgver=152.0.4
pkgrel=1
pkgdesc="Binary version of Abrowser, safe and easy web browser from Mozilla"
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://trisquel.info/en/wiki/abrowser-help"
depends=(alsa-lib  gtk3)
makedepends=(curl)
_ubuntu=24.04.1
_pkgver_x86_64=$(curl -s 'https://archive.trisquel.info/trisquel/pool/main/f/firefox/?C=M;O=D' | grep abrowser_${pkgver}+ | cut -d+ -f2,3 | cut -d'"' -f1 | grep -e ${_ubuntu} | grep amd64)
source=("https://archive.trisquel.info/trisquel/pool/main/f/firefox/${_pkgname}_${pkgver}+${_pkgver_x86_64}")
sha256sums=('636016ede9a1d477ed6d1eaa01762428ca48f7f7189e746f595b0695fef8caf6')

package() {
  tar xaf ${srcdir}/data.tar.* -C ${pkgdir}/
  printf '%b' "  \e[1;36m->\e[0m\033[1m Cleaning up unwanted files...\n\e[0m"
  rm -rv "${pkgdir}"/{etc/apport,etc/apparmor.d,usr/share/apport,usr/share/lintian}
}


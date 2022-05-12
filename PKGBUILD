# Contributor: Figue <ffigue at gmail dot com>

pkgname=abrowser-bin
s_pkgname=${pkgname%-*}
pkgver=100.0
pkgrel=1
pkgdesc="Binary version of Abrowser, safe and easy web browser from Mozilla"
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://trisquel.info/en/wiki/abrowser-help"
depends=('gtk2' 'gtk3' 'gcc-libs' 'libidl2' 'nss>=3.12.10' 'libxt'
         'libxrender' 'hunspell' 'startup-notification' 'mime-types' 'dbus-glib'
         'alsa-lib' 'libevent' 'sqlite3>=3.7.4' 'libnotify' 'desktop-file-utils'
         'libvpx' 'lcms2' 'nspr>=4.8.8' 'libevent' 'libpng' 'cairo')
makedepends=(curl)
_pkgver_x86_64=$(curl -s 'https://archive.trisquel.info/trisquel/pool/main/f/firefox/?C=M;O=D' | grep abrowser_$pkgver | cut -d+ -f2,3 | cut -d'"' -f1 | grep amd64 | head -1)
source=("https://archive.trisquel.info/trisquel/pool/main/f/firefox/${s_pkgname}_${pkgver}+${_pkgver_x86_64}")
sha256sums=('4ede21bb4c0dabc0e9b94bf466bd23e1effcfbb8ea026d9927e8094c1e1a4cb4')

package() {
  tar xJf ${srcdir}/data.tar.xz -C ${pkgdir}/
  printf '%b' "  \e[1;36m->\e[0m\033[1m Cleaning up unwanted files...\n\e[0m"
  rm -rv "${pkgdir}"/{etc/apport,etc/apparmor.d,usr/share/apport,usr/share/lintian}
}


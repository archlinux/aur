# Contributor: Figue <ffigue at gmail dot com>

pkgname=abrowser-bin
s_pkgname=${pkgname%-*}
pkgver=100.0.2
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
_pkgver_x86_64=$(curl -s 'https://archive.trisquel.info/trisquel/pool/main/f/firefox/?C=M;O=D' | grep abrowser_$pkgver | cut -d+ -f2,3 | cut -d'"' -f1 | grep amd64 | sort -rn | head -1)
source=("https://archive.trisquel.info/trisquel/pool/main/f/firefox/${s_pkgname}_${pkgver}+${_pkgver_x86_64}")
sha256sums=('e3e938e398d891c5ec4b834299f6a045d0cfcd6402a72ecb29a5dc4c1997d377')

package() {
  tar xJf ${srcdir}/data.tar.xz -C ${pkgdir}/
  printf '%b' "  \e[1;36m->\e[0m\033[1m Cleaning up unwanted files...\n\e[0m"
  rm -rv "${pkgdir}"/{etc/apport,etc/apparmor.d,usr/share/apport,usr/share/lintian}
}


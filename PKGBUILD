# Contributor: Figue <ffigue at gmail dot com>

pkgname=abrowser-bin
s_pkgname=${pkgname%-*}
pkgver=67.0.3
pkgrel=1
pkgdesc="Binary version of Abrowser, safe and easy web browser from Mozilla"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://trisquel.info/en/wiki/abrowser-help"
depends=('gtk2' 'gtk3' 'gcc-libs' 'libidl2' 'mozilla-common' 'nss>=3.12.10' 'libxt'
         'libxrender' 'hunspell' 'startup-notification' 'mime-types' 'dbus-glib'
         'alsa-lib' 'libevent' 'sqlite3>=3.7.4' 'libnotify' 'desktop-file-utils'
         'libvpx' 'lcms' 'nspr>=4.8.8' 'libevent' 'libpng' 'cairo')
makedepends=(curl)

_pkgver_x86_64=$(curl -s 'http://archive.trisquel.info/trisquel/pool/main/f/firefox/?C=M;O=D' | grep abrowser_$pkgver | cut -d+ -f2,3 | cut -d'"' -f1 | grep amd64 | head -1)
_pkgver_i686=$(curl -s 'http://archive.trisquel.info/trisquel/pool/main/f/firefox/?C=M;O=D' | grep abrowser_$pkgver | cut -d+ -f2,3 | cut -d'"' -f1 | grep i386 | head -1)

source_x86_64=("http://archive.trisquel.info/trisquel/pool/main/f/firefox/${s_pkgname}_${pkgver}+${_pkgver_x86_64}")
source_i686=("http://archive.trisquel.info/trisquel/pool/main/f/firefox/${s_pkgname}_${pkgver}+${_pkgver_i686}")

package() {
  tar xJf ${srcdir}/data.tar.xz -C ${pkgdir}/
  printf '%b' "  \e[1;36m->\e[0m\033[1m Cleaning up unwanted files...\n\e[0m"
  rm -rv "${pkgdir}"/{etc/apport,etc/apparmor.d,usr/share/apport,usr/share/lintian}
}


sha256sums_i686=('d1bf001d191de74f53917af23646884a723db5a1ab642fd7cccde091e12f980e')
sha256sums_x86_64=('62eee1c07f496b3ac85f078b024b1192227312c903c878c627b333497042222b')

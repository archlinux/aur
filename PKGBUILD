# Maintainer: Senan Kelly <senan@senan.xyz>
# Contributor: Morten Linderud <morten@linderud.pw>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Vivien Didelot <vivien+aur@didelot.org>
pkgname=i3blocks-walltime-git
_pkgname=i3blocks
pkgver=1.5.r12.gd25555d
pkgrel=1
pkgdesc='Define blocks for your i3bar status line (sentriz fork, timers aligned to wall time)'
arch=('i686' 'x86_64')
url="https://github.com/sentriz/$_pkgname"
license=('GPL3')
makedepends=('git')
optdepends=('acpi: For example battery script'
            'bc: For bandwidth script'
            'lm_sensors: For temperature script'
            'sysstat: For example cpu_usage script'
            'alsa-utils: For default volume script'
            'playerctl: For mediaplayer contrib script'
            'pandoc: For man pages generation'
            'openvpn: For openvpn contrib script')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/sentriz/$_pkgname")
sha256sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build () {
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package () {
  make -C "$srcdir/$_pkgname" DESTDIR="$pkgdir/" install
}

# vim: et ts=2 sw=2

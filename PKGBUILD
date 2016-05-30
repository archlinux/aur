# Maintainer: Morten Linderud <morten@linderud.pw>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Vivien Didelot <vivien+aur@didelot.org>
pkgname=i3blocks-git
_pkgname=i3blocks
pkgver=1.4.r21.g017395f
pkgrel=2
pkgdesc='Define blocks for your i3bar status line'
arch=('i686' 'x86_64')
url="https://github.com/vivien/$_pkgname"
license=('GPL3')
makedepends=('git' 'ruby-ronn')
optdepends=('acpi: For example battery script'
            'bc: For bandwidth script'
            'lm_sensors: For temperature script'
            'sysstat: For example cpu_usage script'
            'alsa-utils: For default volume script'
            'playerctl: For mediaplayer contrib script'
            'openvpn: For openvpn contrib script')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/vivien/$_pkgname" "colors.patch")
sha256sums=('SKIP'
            '11aed157515cfa77e1cec693effd7300107d3b7aa8a1b0beacf7b395bf9d46fa')

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 <../colors.patch
}

pkgver () {
  cd "$srcdir/$_pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build () {
  make -C "$srcdir/$_pkgname" PREFIX=/usr
}

package () {
  make -C "$srcdir/$_pkgname" DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib install
}

# vim: et ts=2 sw=2

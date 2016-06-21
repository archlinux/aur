# Maintainer: Ingo Bürk <admin at airblader dot de>
# Contributor: Vivien Didelot <vivien+aur@didelot.org>
pkgname=i3blocks-gaps-git
pkgver=1.4.r25.g4cfdf93
pkgrel=1
pkgdesc='Define blocks for your i3bar status line'
arch=('i686' 'x86_64')
url="https://github.com/Airblader/i3blocks-gaps"
license=('GPL3')
makedepends=('git' 'ruby-ronn')
optdepends=('acpi: For example battery script'
            'sysstat: For example cpu_usage script'
            'alsa-utils: For default volume script'
            'playerctl: For mediaplayer contrib script'
            'openvpn: For openvpn contrib script')
provides=("i3blocks")
conflicts=("i3blocks" "i3blocks-git")
source=("git+https://github.com/Airblader/i3blocks-gaps")
sha256sums=('SKIP')

_gitname="i3blocks-gaps"

pkgver () {
  cd "$srcdir/$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build () {
  make -C "$srcdir/$_gitname" clean
  make -C "$srcdir/$_gitname" PREFIX=/usr
}

package () {
  make -C "$srcdir/$_gitname" DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim: et ts=2 sw=2

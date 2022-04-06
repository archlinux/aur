# Maintainer: JeppeX <jesperi dot luoto at gmail dot com>
# Maintainer of the upstream:  Lamelos <lamelos plus aur at gmail dot com>

_shortpkgname=ff2mpv
_pkgname=$_shortpkgname-native-messaging-host
pkgname=$_pkgname-librewolf-git
pkgver=r60.736fb91
pkgrel=1
pkgdesc='Native Messaging Host for ff2mpv firefox addon. Ported to LibreWolf.'
license=('MIT')
url='https://github.com/woodruffw/ff2mpv'
arch=('any')
makedepends=('git')
depends=('python' 'mpv')
conflicts=('ff2mpv-native-messaging-host-git')
install=$_shortpkgname.install
source=("$_shortpkgname"::"git+https://github.com/woodruffw/ff2mpv.git"
        "point-ff2mpv-config-to-python-location.patch")
sha256sums=('SKIP'
            '781abb58bf62138ad603bc67e3227fb8d421091daf9e7475c45d971730b34090')

pkgver() {
  cd "$srcdir/$_shortpkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  patch -Np1 -i point-ff2mpv-config-to-python-location.patch
}

package() {
  cd "$srcdir/$_shortpkgname"
  install -Dm655 "ff2mpv.py" "$pkgdir/usr/share/ff2mpv/ff2mpv.py"
  install -Dm644 "ff2mpv.json" "$pkgdir/usr/lib/librewolf/native-messaging-hosts/ff2mpv.json"
}

# vim: ts=2 sw=2 et:

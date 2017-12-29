# Maintainer: Tobias Witek <tobi@tobi-wan-kenobi.at>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: spookykidmm <https://github.com/spookykidmm>

pkgname=bumblebee-status
pkgver=1.5.1
pkgrel=2
pkgdesc='Modular, theme-able status line generator for the i3 window manager'
arch=('any')
url=https://github.com/tobi-wan-kenobi/bumblebee-status
license=('MIT')
depends=('python' 'python-netifaces' 'python-psutil' 'python-requests')
optdepends=('xorg-xbacklight: to display a displays brightness'
            'xorg-xset: enable/disable automatic screen locking'
            'libnotify: enable/disable automatic screen locking'
            'dnf: display DNF package update information'
            'xorg-setxkbmap: display/change the current keyboard layout'
            'redshift: display the redshifts current color'
            'pulseaudio: control pulseaudio sink/sources'
            'xorg-xrandr: enable/disable screen outputs'
            'pacman: display current status of pacman'
            'iputils: display a ping'
            'i3ipc-python: display titlebar'
            'fakeroot: dependency of the pacman module')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c5b534f37801b88a78f31576f6d3b12f24f538b25bf6f7627d1cd509e3fbb1751213349718f344034344038b1f65de1003f33547cf3861dcf728b4a2e899c9d0')

package() {
  install -d "$pkgdir"/usr/bin \
    "$pkgdir"/usr/share/$pkgname/{bumblebee/modules,themes/icons}
  ln -s /usr/share/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname

  cd $pkgname-$pkgver
  cp -a --parents $pkgname bumblebee/{,modules/}*.py themes/{,icons/}*.json $pkgdir/usr/share/$pkgname
  cp -r bin $pkgdir/usr/share/$pkgname/

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

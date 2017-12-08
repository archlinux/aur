# Maintainer: Tobias Witek <tobi@tobi-wan-kenobi.at>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>

pkgname=bumblebee-status
pkgver=1.5.0
pkgrel=1
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
sha512sums=('68b5d690a5e5c9f1a249adfe8cc3c230fea321eb5f024cc314d91aa1688adc55dbc5ee8d3990b01f33f28cf10e63c757e1f6b0ba47a71515a6dd552612c54ec0')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/themes/icons"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/bumblebee/modules"

  install -d "$pkgdir"/usr/bin \
    "$pkgdir"/usr/share/$pkgname/{bumblebee/modules,themes/icons}
  ln -s /usr/share/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname

  cd $pkgname-$pkgver
  cp -a --parents $pkgname bumblebee/{,modules/}*.py themes/{,icons/}*.json \
    "$pkgdir"/usr/share/$pkgname

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

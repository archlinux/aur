# Maintainer: Tobias Witek <tobi@tobi-wan-kenobi.at>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>

pkgname=bumblebee-status
pkgver=1.4.4
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
sha512sums=('a4a2fa312a92c66a9fa567a3789684f5406646c59706105b5dc9ae7e1d792db0c9c416a111113c1f3054c6c4e0d0193e2bdf7bf1591265f630c4b779609647a3')

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

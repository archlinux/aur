# Maintainer: Tobias Witek <tobi@tobi-wan-kenobi.at>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>

pkgname=bumblebee-status
pkgver=1.4.3
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
sha512sums=('b33560d5037f4cd6731c32f8e0955511dd6beb91b0b6c7af2ac03614865295eb669409137346a8e9482daf345e15297cbc268282aeb327f98da7c7b87a0cba2f')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/themes/icons"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/bumblebee/modules"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/thirdparty/xkbgroup"

  install -d "$pkgdir"/usr/bin \
    "$pkgdir"/usr/share/$pkgname/{bumblebee/modules,themes/icons,thirdparty/xkbgroup}
  ln -s /usr/share/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname

  cd $pkgname-$pkgver
  cp -a --parents $pkgname bumblebee/{,modules/}*.py themes/{,icons/}*.json \
    "$pkgdir"/usr/share/$pkgname

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

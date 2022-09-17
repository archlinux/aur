# Maintainer: Tobias Witek <tobi@tobi-wan-kenobi.at>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: spookykidmm <https://github.com/spookykidmm>

pkgname=bumblebee-status
pkgver=2.1.6
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
            'python-i3ipc: display titlebar'
            'fakeroot: dependency of the pacman module'
            'python-pytz: timezone conversion for datetimetz module'
            'python-tzlocal: retrieve system timezone for datetimetz module'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c011a988ef73715f8f0c7ce653a6df67c4ccfcbb1d02620f381bed1d34b483e5dd4fe07a06e01c788ed6bd8f31dc8ed642f6e35b6166fe69ae4b70f038ca82cd')

package() {
  install -d "$pkgdir"/usr/bin \
    "$pkgdir"/usr/share/$pkgname/bumblebee_status/{core,util} \
    "$pkgdir"/usr/share/$pkgname/bumblebee_status/modules/{core,contrib} \
    "$pkgdir"/usr/share/$pkgname/themes/icons
  ln -s /usr/share/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname
  ln -s /usr/share/$pkgname/bumblebee-ctl "$pkgdir"/usr/bin/bumblebee-ctl

  cd $pkgname-$pkgver
  cp -a --parents $pkgname bumblebee_status/{,core/,util/,modules/core/,modules/contrib/}*.py \
    themes/{,icons/}*.json $pkgdir/usr/share/$pkgname
  cp -r bin $pkgdir/usr/share/$pkgname/

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


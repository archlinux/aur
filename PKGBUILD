# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: ffejery

pkgname='thinkpad-l380-yoga-scripts-git'
_gitname='thinkpad-l380-yoga-scripts'
pkgver=r62.5621f37
pkgrel=1
pkgdesc='A collection of scripts and systemd services for tablet functionality of the ThinkPad L380 Yoga, based onthe original by AdmiralAkber'
url="https://github.com/ffejery/thinkpad-l380-yoga-scripts"
source=('thinkpad-l380-yoga-scripts::git+https://github.com/ffejery/thinkpad-l380-yoga-scripts')
license=('GPL3')
arch=('any')
depends=('xorg-xrandr' 'xorg-xinput' 'xbindkeys' 'kbd' 'systemd' 'gawk')
conflicts=('thinkpad-yoga-scripts-git')
provides=('thinkpad-yoga-scripts-git')
optdepends=(
	'onboard: onscreen keyboard'
	'xf86-input-wacom: for digitizer support'
	)
sha512sums=('SKIP')
makedepends=('git')
install=$pkgname.install

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/$_gitname

  # Install scripts into /opt
  mkdir -p "$pkgdir/opt/$_gitname"
  ## Rotate scripts
  cp -r rotate "$pkgdir/opt/$_gitname"
  ## Wacom scripts
  cp -r wacom "$pkgdir/opt/$_gitname"
  ## Tablet mode
  cp -r tablet "$pkgdir/opt/$_gitname"
  ## Backlight script
  cp -r backlight "$pkgdir/opt/$_gitname"

  # ThinkPad Yoga Systemd Services
  mkdir -p "$pkgdir/usr/lib/systemd/system/"
  cp systemd/*.service "$pkgdir/usr/lib/systemd/system/"

  # Install license
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}




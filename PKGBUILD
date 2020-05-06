# Maintainer: Felix Golatofski
# Contributor: AdmiralAkber

pkgname='thinkpad-yoga-scripts-git'
_gitname='thinkpad-yoga-scripts'
pkgver=r57.5599d33
pkgrel=1
pkgdesc='A collection of scripts and systemd services for tablet functionality of the ThinkPad Yoga'
url="https://github.com/admiralakber/thinkpad-yoga-scripts"
source=('thinkpad-yoga-scripts::git+https://github.com/admiralakber/thinkpad-yoga-scripts')
license=('GPL3')
arch=('any')
depends=('xorg-xrandr' 'xorg-xinput' 'xbindkeys' 'kbd' 'systemd' 'gawk')
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




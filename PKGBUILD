# Maintainer: Piotr Miller <nwg.piotr@gmail.com>

pkgname=azote-git
pkgver=1.7.2.r0.gc198902
pkgrel=2
pkgdesc="Wallpaper manager for Sway, i3 and some other WMs (development version)"
arch=('x86_64')
url="https://github.com/nwg-piotr/azote"
license=('GPL3')
conflicts=('azote')
provides=('azote')
depends=('python' 'python-setuptools' 'python-gobject' 'python-pillow' 'gtk3' 'feh' 'xorg-xrandr' 'wmctrl')
optdepends=('python-send2trash: trash support'
			'grim: for screen color picker on Sway'
			'slurp: for screen color picker on Sway'
			'maim: for screen color picker on X11')

source=("git+https://github.com/nwg-piotr/azote.git")
md5sums=('SKIP')

pkgver() {
  cd azote
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd azote
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
  
  install -Dm755 dist/azote "$pkgdir"/usr/bin/azote
  install -Dm755 dist/azote.desktop "$pkgdir"/usr/share/applications/azote.desktop
  install -Dm644 dist/azote.svg "$pkgdir"/usr/share/azote/azote.svg
}


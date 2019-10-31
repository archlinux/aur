# Maintainer: Piotr Miller <nwg.piotr@gmail.com>

pkgname=azote-git
pkgver=1.5.5.r7.g46027c3
pkgrel=1
pkgdesc="Wallpaper manager for Sway, i3 and some other WMs (development version)"
arch=('x86_64')
url="https://github.com/nwg-piotr/azote"
license=('GPL3')
conflicts=('azote')
provides=('azote')
depends=('python' 'python-setuptools' 'python-gobject' 'python-pillow' 'gtk3' 'feh' 'xorg-xrandr' 'wmctrl')
optdepends=('python-send2trash: trash support')

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


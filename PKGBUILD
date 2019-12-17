# Maintainer: Piotr Miller <nwg.piotr@gmail.com>

pkgname=azote-git
pkgver=1.7.7.r13.g9a7d731
pkgrel=1
pkgdesc="Wallpaper & color manager for Sway, i3 and other WMs (development version)"
arch=('x86_64')
url="https://github.com/nwg-piotr/azote"
license=('GPL3')
conflicts=('azote')
provides=('azote')
depends=('python' 'python-setuptools' 'python-gobject' 'python-pillow' 'gtk3' 'feh' 'xorg-xrandr')
optdepends=('python-send2trash: trash support'
			'grim: for screen color picker on Sway'
			'slurp: for screen color picker on Sway'
			'maim: for screen color picker on X11'
			'imagemagick: for screen color picker on X11 and Sway'
			'libappindicator-gtk3: for tray status icon'
			'python-pyaml: for alacritty.yml toolbox')

source=("git+https://github.com/nwg-piotr/azote.git")
md5sums=('SKIP')

pkgver() {
  cd azote
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd azote
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
  
  install -D -m 755 dist/azote-arch "$pkgdir"/usr/bin/azote
  install -Dm 644 LICENSE-COLORTHIEF "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-COLORTHIEF"
  install -Dm755 dist/azote.desktop "$pkgdir"/usr/share/applications/azote.desktop
  install -Dm644 dist/azote.svg "$pkgdir"/usr/share/azote/azote.svg
  install -Dm644 dist/indicator_active.png "$pkgdir"/usr/share/azote/indicator_active.png
  install -Dm644 dist/indicator_attention.png "$pkgdir"/usr/share/azote/indicator_attention.png
}


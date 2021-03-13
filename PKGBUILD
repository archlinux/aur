# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('azote')
pkgver=1.9.0
pkgrel=1
pkgdesc="Wallpaper & color manager for Sway, i3 and other WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/azote"
license=('GPL3')
depends=('python' 'python-setuptools' 'python-gobject' 'python-pillow' 'gtk3' 'python-cairo' 'python-send2trash')
optdepends=('imagemagick: for screen color picker'
            'grim: for screen color picker on sway/Wayfire'
			'slurp: for screen color picker on sway/Wayfire'
			'maim: for screen color picker on X11-based WMs'
			'libappindicator-gtk3: for tray status icon'
			'python-yaml: for alacritty.yml toolbox'
			'swaybg: for setting background on wlroots-based compositors other than sway'
			'feh: for setting background on X11-based WMs'
			'xorg-xrandr: for checking outputs on X11-based WMs'
			'wlr-randr-git: for checking outputs on wlroots-based compositors other than sway')

source=("https://github.com/nwg-piotr/$pkgname/archive/v$pkgver.tar.gz")

md5sums=('df43b964ed35443de9916da9eb32e437')

package() {
  install -D -m 755 "$pkgname"-"$pkgver"/dist/azote "$pkgdir"/usr/bin/azote
  install -D -t "$pkgdir"/usr/share/pixmaps "$pkgname"-"$pkgver"/dist/azote.svg
  install -D -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"/dist/indicator*.png
  install -D -t "$pkgdir"/usr/share/applications "$pkgname"-"$pkgver"/dist/azote.desktop
  install -Dm 644 "$pkgname"-"$pkgver"/LICENSE-COLORTHIEF "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-COLORTHIEF"
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}


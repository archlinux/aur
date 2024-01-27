# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('azote')
pkgver=1.12.4
pkgrel=1
pkgdesc="Wallpaper & color manager for wlroots-based compositors and some X11 WMs"
arch=('any')
url="https://github.com/nwg-piotr/azote"
license=('GPL3')
provides=('azote')
conflicts=('azote' 'azote-git')
depends=('python' 'python-setuptools' 'python-gobject' 'python-pillow' 'gtk3' 'python-cairo' 'python-send2trash')
optdepends=('imagemagick: for screen color picker'
            'grim: for screen color picker on wlroots'
			'slurp: for screen color picker on wlroots'
			'maim: for screen color picker on X11-based WMs'
			'libappindicator-gtk3: for tray status icon'
			'python-yaml: for alacritty.yml toolbox'
			'swaybg: for setting background on wlroots-based compositors'
			'feh: for setting background on X11-based WMs'
			'xorg-xrandr: for checking outputs on X11-based WMs'
			'wlr-randr-git: for checking outputs on wlroots-based compositors other than sway and Hyprland')

source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/$pkgname/archive/v$pkgver.tar.gz")

md5sums=('0a3f33f355cd0427b763c223121df793')

package() {
  install -D -m 755 "$pkgname"-"$pkgver"/dist/azote "$pkgdir"/usr/bin/azote
  install -D -t "$pkgdir"/usr/share/pixmaps "$pkgname"-"$pkgver"/dist/azote.svg
  install -D -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"/dist/indicator*.png
  install -D -t "$pkgdir"/usr/share/applications "$pkgname"-"$pkgver"/dist/azote.desktop
  install -Dm 644 "$pkgname"-"$pkgver"/LICENSE-COLORTHIEF "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-COLORTHIEF"
  cd "$srcdir/$pkgname-$pkgver"
  install -D -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
  install -D -t "$pkgdir"/usr/share/doc/"$pkgname" README.md
  
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}


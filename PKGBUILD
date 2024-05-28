# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('azote')
pkgver=1.12.9
pkgrel=1
pkgdesc="Wallpaper & color manager for wlroots-based compositors and some X11 WMs"
arch=('any')
url="https://github.com/nwg-piotr/azote"
license=('GPL3')
depends=('python' 'python-setuptools' 'python-gobject' 'python-pillow' 'gtk3' 'python-cairo' 'python-send2trash')
makedepends=('python-build' 'python-installer' 'python-wheel')
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

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v"$pkgver".tar.gz")

md5sums=('381c23173f74ce194fdaa3130262d514')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
  install -D -t "$pkgdir"/usr/share/pixmaps "$pkgname"-"$pkgver"/dist/azote.svg
  install -D -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"/dist/indicator*.png
  install -D -t "$pkgdir"/usr/share/applications "$pkgname"-"$pkgver"/dist/azote.desktop
  install -Dm 644 "$pkgname"-"$pkgver"/LICENSE-COLORTHIEF "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-COLORTHIEF"
  cd "${pkgname}-${pkgver}"
  install -D -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
  install -D -t "$pkgdir"/usr/share/doc/"$pkgname" README.md
  
  python -m installer --destdir="${pkgdir}" dist/*.whl
}


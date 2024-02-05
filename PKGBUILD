# Maintainer: Fernando Vasquez <fmorataya.04@gmail.com>

pkgname=wpgtk
pkgver=6.6.1
pkgrel=6
pkgdesc="A gui wallpaper chooser that changes your WM theme, GTK theme and more"
arch=('any')
url="https://github.com/deviantfero/wpgtk/"
license=('GPLv2')
makedepends=('python-setuptools' 'python-build' 'python-installer')
depends=('python' 'python-pillow' 'python-gobject' 'gtk3' 'libxslt' 'python-pywal')
optdepends=('feh: set wallpaper'
            'nitrogen: set wallpaper'
			'xsettingsd: live reload GTK+ theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/deviantfero/wpgtk/archive/${pkgver}.tar.gz"
		"wpgtk.png::https://github.githubassets.com/images/icons/emoji/unicode/1f3b4.png")
sha256sums=('SKIP' 'SKIP')

build(){
  cd "wpgtk-${pkgver}"
  python -m build --wheel
}

package() {
  cd "${srcdir}/wpgtk-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 wpgtk/misc/wpgtk.desktop "$pkgdir/usr/share/applications/wpgtk.desktop"
  install -Dm644 ../wpgtk.png "$pkgdir/usr/share/pixmaps/wpgtk.png"
  install -Dm644 completions/bash/wpg "$pkgdir/usr/share/bash-completion/wpg"
  install -Dm644 completions/zsh/_wpg "$pkgdir/usr/share/zsh/site-functions/_wpg"
  install -Dm644 wpgtk/misc/wpg-install.sh "$pkgdir/usr/bin/wpg-install.sh"
}


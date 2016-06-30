# Maintainer: nrio <nrio@mailbox.org>
pkgname=tcharmap-git
pkgver=r15.f3884a6
pkgrel=1
pkgdesc="Overview of unicode characters and their LaTeX counterpart"
arch=('any')
url="https://github.com/nrio0/tcharmap"
license=('MIT')
options=(!emptydirs)
depends=('python' 'python-yaml' 'python-pyqt5')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/nrio0/tcharmap.git'
        'tcharmap_start')
sha256sums=('SKIP'
            '5b72ad0b095beb7c8becb647b2f2cc054e0bb4f476bce66cf2d33af907dec4e5')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "$srcdir/tcharmap_start" "$pkgdir/usr/bin/tcharmap"
	cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname-%git}/LICENSE"
}

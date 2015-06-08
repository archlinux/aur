# Maintainer: Gabriel Acosta <acostadariogabriel@gmail.com>
# Patched by: Victor <vicgua@outlook.com>

pkgname=edis-git
pkgver=r1053.3761ba5
pkgrel=1
pkgdesc="a simple cross-platform IDE for C"
arch=('any')
url="http://centaurialpha.github.io/edis"
license=('GPLv3')
depends=('python' 'python-pyqt4' 'python-qscintilla')
makedepends=('git')
optdepends=('ctags: soporte para generar árbol de símbolos'
            'cppcheck: análisis estático de errores')
provides=(edis)
conflicts=(edis edis-c edis-c-git)
replaces=(edis-c-git)
install=$pkgname.install
source=('edis::git+https://github.com/centaurialpha/edis.git'
        'edis.png'
        'edis.desktop')
md5sums=('SKIP'
         'b62bba84e3be425a165f78f4261de1c7'
         '4657b48c3efce21a9e5f8804d4892431')

pkgver() {
	cd "$srcdir/edis"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $srcdir/edis

	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 "edis.desktop" "$pkgdir/usr/share/applications/edis.desktop"
}

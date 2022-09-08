# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: ov3rl0w <dalcjor@libmail.eu>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sean Haugh <seanphaugh@gmail.com>

pkgname=pywal-git
pkgver=3.3.0.r128.g4997a49
pkgrel=1
pkgdesc="Generate and change color-schemes on the fly."
arch=('any')
url="https://github.com/dylanaraps/pywal"
license=('MIT')
depends=('python' 'imagemagick')
makedepends=('python-setuptools')
optdepends=('feh: set wallpaper'
            'nitrogen: set wallpaper'
            'python2: reload gtk2 themes on the fly')
provides=("${pkgname%-git}" "python-${pkgname%-git}")
conflicts=("${pkgname%-git}" "python-${pkgname%-git}")
source=('git+https://github.com/dylanaraps/pywal.git')
sha256sums=('SKIP')
conflicts=('python-pywal')
provides=('python-pywal')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	export PYTHONHASHSEED=0
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}

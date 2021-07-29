# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Fenner Macrae <fmacrae.dev at gmail dot com>

pkgname=flashfocus
pkgver=2.2.2
pkgrel=2
pkgdesc="Simple Xorg window focus animations for tiling window managers"
url="https://www.github.com/fennerm/flashfocus"
license=('MIT')
arch=('any')
depends=('python-cffi>=1.11'
         'python-cffi<2.0.0'
         'python-xcffib>=0.6.0'
         'python-xcffib<1.0.0'
         'python-click>=6.7'
         'python-click<9.0.0'
         'python-xpybutil>=0.0.6'
         'python-xpybutil<1.0.0'
         'python-marshmallow>=2.15.0'
         'python-marshmallow<4.0.0'
         'python-yaml>=5.1'
         'python-yaml<6.0.0'
         'python-i3ipc>=2.1.1'
         'python-i3ipc<3.0.0')
makedepends=('python-setuptools' 'python-pytest-runner')
optdepends=('i3-wm: compatible window manager'
            'sway: compatible window manager'
            'bspwm: compatible window manager'
            'awesome: compatible window manager'
            'xmonad: compatible window manager'
            'picom: recommended compositor if using X-based window managers')
# checkdepends=('python-pytest'
#               'python-pytest-cov'
#               'python-pytest-factoryboy'
#               'python-pytest-runner'
#               'python-pytest-lazy-fixture')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6be9cfb11370212078f6ddc81222220f2b0ae73dff3b1aaf11410536f0ef27c3')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

# check() {
#   cd "$pkgname-$pkgver"
#   pytest -v tests
# }

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 flashfocus.service -t "$pkgdir/usr/lib/systemd/user/"
}

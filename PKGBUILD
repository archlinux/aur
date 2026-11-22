# Maintainer: Reyzer <reyzervt@gmail.com>
pkgname=grubmgr-git
pkgver=r2.19fe9a7
pkgrel=1
pkgdesc="Grub2 Config manager (themes and config)"
arch=('any')
url="https://github.com/iReyzer/Grub-Manager"
license=('MIT')
depends=('python' 'grub' 'polkit')
optdepends=('pyside6: graphical interface (grubmgr-gui)'
			'os-prober: detect other operating systems')
makedepends=('git'	'python-build' 'python-installer' 'python-uv-build')
provides=('grubmgr')
conflicts=('grubmgr')
source=("grubmgr::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd grubmgr
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd grubmgr
	python -m build --wheel --no-isolation
}

package() {
	cd grubmgr
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 packaging/dev.reyzer.grubmgr.policy -t "$pkgdir/usr/share/polkit-1/actions/"
	install -Dm644 packaging/grubmgr.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

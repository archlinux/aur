# Maintainer: éclairevoyant
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Denis Kasak <dkasak AT termina DOT org DOT uk>

_pkgname=aiomultiprocess
pkgname="python-$_pkgname"
pkgver=0.9.0
pkgrel=1
pkgdesc="asyncio version of the standard multiprocessing module"
url="https://github.com/omnilib/$_pkgname"
arch=(any)
license=(MIT)
depends=(python)
makedepends=(git python-{build,installer,wheel} python-flit-core)
source=("git+$url.git#tag=abaf2dbafa5582d80645eb0e40da4bc8a1c751a1?signed")
b2sums=('SKIP')
validpgpkeys=('9A24B14A6239AA5A450708B671FCFA26C45D960E') # John Reese <john@noswap.com>

prepare() {
	git -C $_pkgname clean -dfx
}

build() {
	cd $_pkgname
	python -m build -wn
}

package() {
	cd $_pkgname
	PYTHONHASHSEED=0 python -m installer -d "$pkgdir" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -vdm755 "$pkgdir/usr/share/licenses/$pkgname/"
	ln -vs $_site/$_pkg-$pkgver.dist-info/LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/"
}

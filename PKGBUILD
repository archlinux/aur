# Maintainer: Xuelin Yang <xuelin@adamantyee.cc>
pkgname='python-whenever'
pkgdesc='Modern datetime library for Python'
pkgver=0.11.0
pkgrel=1
_srcname="${pkgname/python-/}"
_wheel="$_srcname-$pkgver-py3-none-any.whl"
url="https://github.com/ariebovenberg/$_srcname"
arch=('any')
license=('MIT')
makedepends=(
	'python-installer'
)
depends=(
	'python>=3.10'
)
source=("$_wheel::https://files.pythonhosted.org/packages/py3/w/$_srcname/$_wheel")
noextract=("$_wheel")
sha256sums=('2ed4a4562b1b99bb21ff236954d898092fdc45c67e61ae2b154ff471c9e76d54')

package() {
	python -m installer --destdir="$pkgdir" --prefix=/usr "$srcdir/$_wheel"
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" \
		< <(bsdtar -xOf "$srcdir/$_wheel" "$_srcname-$pkgver.dist-info/licenses/LICENSE")
}

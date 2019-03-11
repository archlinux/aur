# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=auditwheel
pkgver=2.0.0
pkgrel=2
pkgdesc='Cross-distribution Linux wheels'
arch=(any)
url="https://github.com/pypa/auditwheel"
license=(MIT)
depends=(python-wheel python-pyelftools)
_pyarch=py3
_wheel="$pkgname-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('63fe2fdda4d6c5f7b04e3982896428e3c243fdf8b8543aaa567bf0e1ce26b44a')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	
	cat >auditwheel.py <<-EOF
	#!/usr/bin/env python3
	from auditwheel.main import main
	main()
	EOF
	install -Dm755 auditwheel.py "$pkgdir/usr/bin/auditwheel"
}

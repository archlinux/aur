# Maintainer: George Macon <george dot macon at gmail dot com>
_name=tarsnapper
pkgname=${_name}
pkgver=0.5.0
pkgrel=2
pkgdesc="Manages tarsnap backups"
arch=(any)
url="https://github.com/miracle2k/tarsnapper"
license=('BSD')
depends=("python-yaml>=3.09"
         "python-dateutil>=2.4.0"
         "python-pexpect>=3.1")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "remove-argparse.patch")
sha256sums=(b129b0fba3a24b2ce80c8a2ecd4375e36b6c7428b400e7b7ab9ea68ec9bb23ec
            SKIP)

prepare() {
	cd "$pkgname-$pkgver"
    patch -p1 <"$srcdir"/remove-argparse.patch
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

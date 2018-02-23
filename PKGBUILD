# Maintainer: Jon Gjengset <jon@thesquareplanet.com>, Saren Arterius <saren@wtako.net>
# Maintainer: George Amanakis<gamanakis@gmail.com>
pkgname=cpuset
pkgver=r59.02ef9e0
pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Cpuset is a Python application to make using the cpusets facilities in the Linux kernel easier."
arch=('any')
url="https://github.com/lpechacek/cpuset/"
license=('GPL2')
depends=('python' 'python-future')
options=('!emptydirs')
# 0001-remove-exclusivity.patch removes setting cpu_exclusive and mem_exclusive to 1,
# thus enabling cpuset to run even when a machine.slice has been created and cannot be modified
source=('git+https://github.com/lpechacek/cpuset'
	'0001-remove-exclusivity.patch')
md5sums=('SKIP'
         'f944918002bde0e949a694741309fda8')

package() {
	cd "$srcdir/$pkgname"
	patch -p1 -i ../0001-remove-exclusivity.patch
	python setup.py install --root="$pkgdir/" --optimize=1
}

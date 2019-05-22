# Maintainer: Jon Gjengset <jon@thesquareplanet.com>, Saren Arterius <saren@wtako.net>
# Maintainer: George Amanakis<gamanakis@gmail.com>
pkgname=cpuset-git
pkgver=r76.b5a70c1
pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Cpuset is a Python application to make using the cpusets facilities in the Linux kernel easier."
arch=('any')
url="https://github.com/lpechacek/cpuset/"
license=('GPL2')
depends=('python' 'python-future')
options=('!emptydirs')
provides=('cpuset')
conflicts=('cpuset')
# 0001-remove-exclusivity.patch removes setting cpu_exclusive and mem_exclusive to 1,
# thus enabling cpuset to run even when a machine.slice has been created and cannot be modified
source=('git+https://github.com/lpechacek/cpuset'
	'0001-remove-exclusivity.patch')
md5sums=('SKIP'
         'f3dc8cdca7977027c5683ce51462b6fa')

package() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i ../0001-remove-exclusivity.patch
	python setup.py install --root="$pkgdir/" --optimize=1
}

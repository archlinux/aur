# Maintainer: Kai Muenz <kai+archlinux@muenz.net>
_pkgname=odr-radiodns-bridge
pkgname=$_pkgname-git
pkgver=0.1.r36.387721d
pkgrel=1
pkgdesc="Opendigitalradio tool to bridge RadioDNS applications into the OpenDigitalRadio environment"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Opendigitalradio/$_pkgname"
license=('GPL')
groups=('ODR')
depends=('python-hybridspi' 'boost' 'python-pyradiodns')
checkdepends=()
optdepends=()
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
    python setup.py build
}

package() {
	cd "$_pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	mkdir -p "$pkgdir"/etc/"$_pkgname"
	cp "$srcdir"/"$_pkgname"/mux.conf "$pkgdir"/etc/"$_pkgname"/mux.conf.example
}

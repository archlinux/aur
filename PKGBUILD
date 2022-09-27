# Maintainer: luciole <luciole at systemli dot org>
_pkgname="onionprobe"
pkgname="${_pkgname}-git"
pkgver=r323.6c0a813
pkgrel=1
pkgdesc="git build of Onionprobe (tool for testing and monitoring the status of Tor Onion Services sites)"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://gitlab.torproject.org/tpo/onion-services/onionprobe.git"
depends=("git"
	 "python" 
	 "python-prometheus_client" 
	 "python-stem" 
	 "python-cryptography" 
	 "python-yaml" 
	 "python-requests" 
	 "python-pysocks" 
	 "tor")
license=("GPL3")
sha512sums=("SKIP")

source=("${_pkgname}::git+${url}")

pkgver() {
  cd $srcdir/${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"
  make release
}

package() {
  cd "$srcdir/${_pkgname}"
  make
}

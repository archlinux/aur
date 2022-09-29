# Maintainer: Matan h <matan.honig2@gmail.com>
pkgname="zenmap-python3-git"
pkgver=7.92SVN
pkgrel=1
pkgdesc="Graphical Nmap frontend and results viewer - rerwite in python 3"
arch=("any")
url="https://github.com/kulikjak/nmap"
license=("GPL2")
makedepends=("unzip")

depends=("nmap"
            "gtk3"
            "python-gobject")

optdepends=("gksu: starting zenmap as root")

provides=("zenmap")
source=("https://github.com/kulikjak/nmap/archive/refs/heads/master-python3.zip")
md5sums=("SKIP")

pkgver() {
	cat "$srcdir/nmap-master-python3/zenmap/share/zenmap/config/zenmap_version"
}

package() {
	cd "$srcdir/nmap-master-python3/zenmap"
  
  python3 setup.py install --prefix "/usr" --root="${pkgdir}" --optimize=1
	install -Dm644 ../docs/zenmap.1 "${pkgdir}/usr/share/man/man1/zenmap.1"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "../${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

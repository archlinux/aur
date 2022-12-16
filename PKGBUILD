# Maintainer: Matan h <matan.honig2@gmail.com>
pkgname="zenmap-python3-git"
_pkgname=nmap
pkgver=7.93
pkgrel=1
pkgdesc="Graphical Nmap frontend and results viewer - rerwite in python 3"
arch=("any")
url="https://github.com/nmap/nmap"
license=("GPL2")
makedepends=("unzip")
conflicts=("zenmap")
depends=("python"
            "python-cairo"
            "nmap"
            "gtk3"
            "python-gobject")

optdepends=("gksu: starting zenmap as root")

provides=("zenmap")
source=("${_pkgname}.zip::https://github.com/nmap/nmap/archive/refs/heads/master.zip")
md5sums=("SKIP")

pkgver() {
	cat "$srcdir/nmap-master/zenmap/share/zenmap/config/zenmap_version"
}

package() {
    cd "$srcdir/nmap-master/zenmap"
    python3 setup.py install --prefix "/usr" --root="${pkgdir}" --optimize=1

    rm "${pkgdir}/usr/bin/uninstall_zenmap"
    install -Dm644 ../docs/zenmap.1 "${pkgdir}/usr/share/man/man1/zenmap.1"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m compileall "${pkgdir}"/usr/lib/python3.10/site-packages
}

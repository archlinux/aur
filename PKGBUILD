# Maintainer: Twann <tw4nn@riseup.net>

pkgname=tblock
pkgver=2.1.0
pkgrel=1
provides=("$pkgname")
pkgdesc="An anti-capitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=(
        "make"
        "pandoc"
        "gzip"
        "python>=3"
        "python-setuptools"
)
depends=(
        "python-urllib3"
        "python-requests"
        "python-colorama"
)
source=(
        "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz"
)
sha512sums=(
        "b47352f822e671e18405c4c0834c905be7d48d81dc9326d0f3b37e164c2c749bb3742bebea1ba979bf2fd07830cf20cee4291675fcbf15db4def0c14cc0a77f5"
)
backup=("etc/tblock.conf")

build()
{
        cd "$srcdir/$pkgname"
        make
}

package()
{
        cd "$srcdir/$pkgname"
        # Install the package
        make install ROOT="$pkgdir"
        # Install the configuration file
        make install-config ROOT="$pkgdir"
}

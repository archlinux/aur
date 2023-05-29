# Maintainer: Joey Holtzman <joeyholtzman0507 at gmail dot com>

_pkgname=pacman-venv
pkgname=$_pkgname-git
pkgver=0.4.r0.g86eb3bb
pkgrel=1
pkgdesc="A tool to create virtual environments for Pacman (development version)"
arch=('x86_64')
url="https://github.com/jdholtz/pacman-venv"
license=('MIT')
depends=('bash' 'pacman' 'sudo')
source=("git+https://github.com/jdholtz/pacman-venv.git")
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
    make DESTDIR="$pkgdir" PREFIX="/usr" VERSION=$pkgver version

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

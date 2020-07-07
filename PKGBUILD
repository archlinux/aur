# Maintainer: Radostin Stoyanov <rstoyanov1@gmail.com>
pkgname=virt-bootstrap-git
pkgver=r153.8a7e752
pkgrel=1
pkgdesc="A tool for creating the root filesystem of libvirt-based containers."
arch=('any')
url="https://github.com/virt-manager/virt-bootstrap"
license=('GPL')
depends=('python' 'libguestfs' 'skopeo' 'libvirt-sandbox' 'python' 'python-passlib')
makedepends=('git' 'python')
provides=("virt-bootstrap")
conflicts=("virt-bootstrap")
source=('virt-bootstrap-git::git+https://github.com/virt-manager/virt-bootstrap#branch=master')
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-VCS}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname%-VCS}"
    python setup.py install --prefix=$pkgdir
    mkdir $pkgdir/usr
    mv $pkgdir/bin $pkgdir/usr/
    mv $pkgdir/lib $pkgdir/usr/
    mv $pkgdir/share $pkgdir/usr/
}

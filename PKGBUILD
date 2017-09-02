# Maintainer: Alex O'Brien <alex@emobrien.com>
pkgname=virt-bootstrap-git # '-bzr', '-git', '-hg' or '-svn'
pkgver="r110.9e6a003"
pkgrel=1
pkgdesc="A tool for creating the root filesystem of libvirt-based containers."
arch=('any')
url="https://github.com/virt-manager/virt-bootstrap"
license=('GPL')
depends=('python2' 'libguestfs' 'skopeo' 'libvirt-sandbox' 'python')
makedepends=('git' 'python2') # 'bzr', 'git', 'mercurial' or 'subversion'
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
    python2 setup.py build
}

package() {
    cd "$srcdir/${pkgname%-VCS}"
    python2 setup.py install --prefix=$pkgdir
    mkdir $pkgdir/usr
    mv $pkgdir/bin $pkgdir/usr/
    mv $pkgdir/lib $pkgdir/usr/
    mv $pkgdir/share $pkgdir/usr/
}

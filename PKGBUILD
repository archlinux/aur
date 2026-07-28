# Maintainer: Your Name <your@email.com>
pkgname=archinstaller-git
pkgver=1.0.2
pkgrel=1
pkgdesc="Modern GTK4 GUI installer for Arch Linux"
arch=('any')
url="https://github.com/bunyaminmrcn/archinstaller"
license=('GPL3')
depends=('python' 'gtk4' 'libadwaita' 'python-gobject' 'python-cairo'
         'gparted' 'reflector' 'arch-install-scripts' 'cryptsetup'
         'dosfstools' 'btrfs-progs' 'xfsprogs' 'f2fs-tools')
makedepends=('git' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
provides=('archinstaller')
conflicts=('archinstaller')

source=("git+https://github.com/bunyaminmrcn/archinstaller.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/archinstaller"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/archinstaller"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/archinstaller"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

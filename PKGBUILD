# Maintainer: Eloy Garcia Almaden <eloy.garcia.pca@gmail.com>
pkgname=buttermanager
pkgver=2.5.2
pkgrel=0
epoch=
pkgdesc="Graphical tool to create BTRFS snapshots, balance filesystems and upgrade the system safetly"
arch=('x86_64')
url="https://github.com/egara/buttermanager"
license=('GPL')
groups=()
depends=('btrfs-progs' 'python>=3' 'grub-btrfs' 'python-setuptools' 'python-pyaml' 'python-pyqt5' 'tk')
makedepends=('python>=3' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('https://github.com/egara/buttermanager/archive/2.5.2.tar.gz')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
        cd "$pkgname-$pkgver"
        python setup.py build
}

package() {
        cd "$pkgname-$pkgver"
        # Creating destination directory
        install -dm755 "$pkgdir/opt/$pkgname"

        # Installing ButterManager using python-setuptools
        echo -e "\n Installing ButterManager. Please wait..."
        python setup.py install --root="$pkgdir" --optimize=1 --skip-build

        # Copying .desktop file and icon
        echo -e "\n Creating desktop icon. Finishing the installation"
        install -Dm644 "$srcdir/$pkgname-$pkgver/packaging/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
        install -Dm644 "$srcdir/$pkgname-$pkgver/packaging/$pkgname.svg" "$pkgdir/opt/$pkgname/gui/$pkgname.svg"
}

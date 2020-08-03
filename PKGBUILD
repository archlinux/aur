# Maintainer: Eloy Garcia Almaden <eloy.garcia.pca@gmail.com>
pkgname=buttermanager
pkgver=2.0
pkgrel=1
epoch=
pkgdesc="Graphical tool to create BTRFS snapshots, balance filesystems and upgrade the system safetly"
arch=('x86_64')
url="https://github.com/egara/buttermanager"
license=('GPL')
groups=()
depends=('btrfs-progs' 'python>=3' 'grub-btrfs')
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
source=('git+https://github.com/egara/buttermanager#branch=master')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
        cd "$pkgname"
        # Creating destination directory
        install -dm755 "$pkgdir/opt/$pkgname"

        # Copying all the structure to the destination directory
        cp -ar "$srcdir/$pkgname/$pkgname/" "$pkgdir/opt/$pkgname/"

        # Copying requirements
        echo -e "\n Copying resources..."
        cp -ar "requirements.txt" "$pkgdir/opt/$pkgname/"
  
        # Creating virtual environment
        echo -e "\n Creating virtual environment..."
        cd "$pkgdir/opt/$pkgname/"
        python -m venv env

        # Enabling virtual environment
        echo -e "\n Enabling virtual environment..."
        source env/bin/activate

        # Installing requirements
        echo -e "\n Installing all the required modules into the virtual environment. Please wait..."
        pip install --upgrade pip
        pip install -r requirements.txt         

        # Copying .desktop file and icon
        echo -e \n "Creating desktop icon. Finishing the installation"
        install -Dm644 "$srcdir/$pkgname/aur/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
        install -Dm644 "$srcdir/$pkgname/aur/$pkgname.svg" "$pkgdir/opt/$pkgname/gui/$pkgname.svg"
}

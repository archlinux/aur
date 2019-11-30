# Maintainer: AdinGreen <poemdistance@gmail.com>

pkgname=mstran
pkgver=version
pkgrel=1.0
epoch=
pkgdesc=""
arch=(x86_64)
url=""
license=('GPL')
groups=()
depends=('gtk3' 'libxtst' 'libx11' 'xdotool' 'python-pip' 'tesseract' 'meson')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/poemdistance/Mstran-pure.git')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
        cd Mstran-pure/;
        sudo pip3 install pytesseract tesseract pillow meson mysql_connector_repackaged \
            Pillow pytesseract requests setuptools SocksiPy_branch sysv_ipc termcolor \
            mysql-connector-python beautifulsoup4
    }

build() {

    cd Mstran-pure/src;
    bash prepare.sh;
    make;
    cd ../gnome-screenshot;
    bash install.sh;

    cd ../baidu-translate
    sudo ./setup.py install

    cd ../google-translate
    sudo ./setup.py install
}

package() {
    cd $srcdir/Mstran-pure/src;
    make install;
    sudo rm "/tmp/yaourt-tmp-"$USER"/aur-mstran/src/Mstran-pure/baidu-translate" -rf
    sudo rm "/tmp/yaourt-tmp-"$USER"/aur-mstran/src/Mstran-pure/google-translate" -rf
    sudo rm "/home/"$USER"/.cache/aurman/mstran/src/Mstran-pure/baidu-translate" -rf
    sudo rm "/home/"$USER"/.cache/aurman/mstran/src/Mstran-pure/google-translate" -rf
}

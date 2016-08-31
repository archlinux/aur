# Maintainer: Aaron Abbott <aabmass@gmail.com>
pkgname=hyperterm
pkgver=0.7.1
pkgrel=3
epoch=
pkgdesc="A terminal emulator built with JS/HTML/CSS on electron"
arch=('any')
url="https://hyperterm.org/"
license=('MIT')
groups=()
depends=('nodejs' 'electron')
makedepends=('npm' 'python2')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/zeit/$pkgname/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('f06827cbae82f13237cc20dfd0ee170d')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
    npm install
}

build() {
	cd "$pkgname-$pkgver"
    npm run pack
}

package() {
    cd "$pkgname-$pkgver"

    _appdir="/usr/lib/$pkgname"
    _libinstall="${pkgdir}${_appdir}"

    mkdir -p "$pkgdir/usr/bin" "$_libinstall"
    cp -R dist/linux/* "$_libinstall"

    # link the binary to /usr/bin
    cd $pkgdir/usr/bin
    ln -s "../lib/$pkgname/HyperTerm" HyperTerm

    # # TODO: remove included electron libs and use the system ones by symlink
    # cd "$_libinstall"
    # rm libnode.so libffmpeg.so
    # ln -s /usr/share/electron/lib{node,ffmpeg}.so .
}

# Maintainer: Aaron Abbott <aabmass@gmail.com>
# Contributer: fleischie
# Contributer: auk

## will rename by AUR mod
# pkgname=hyper
pkgname=hyperterm
pkgver=0.8.1
pkgrel=1
epoch=
pkgdesc="A terminal built on web technologies"
arch=('any')
url="https://hyper.is/"
license=('MIT')
groups=()
depends=('nodejs' 'electron')
makedepends=('npm' 'python2')
checkdepends=()
optdepends=()
provides=()

## will uncomment these when an AUR mod renames this package. I can't push this
## with the new name. Have to have it done manually.
# conflicts=('hyperterm')
# replaces=('hyperterm')
backup=()
options=()
install=
changelog=
source=(
    "https://github.com/zeit/$pkgname/archive/${pkgver}.tar.gz"
)
noextract=()
md5sums=('bf5575c5bcf8cbedcdf4d7118128c2cd')
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
    cp -R dist/linux-unpacked/* "$_libinstall"

    # link the binary to /usr/bin
    cd $pkgdir/usr/bin
    ln -s "../lib/$pkgname/Hyper" Hyper

    # # TODO: remove included electron libs and use the system ones by symlink
    # cd "$_libinstall"
    # rm libnode.so libffmpeg.so
    # ln -s /usr/share/electron/lib{node,ffmpeg}.so .
}

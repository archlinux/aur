# Maintainer: mfw <espadonne@outlook.com>

pkgname=facsimile
pkgver=0.9.4
pkgrel=1
pkgdesc='Terminal text editor written in Fortran with VSCode-style keybindings'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/FortranGoingOnForty/facsimile'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('gcc-fortran' 'fortran-fpm')
source=("git+https://github.com/FortranGoingOnForty/facsimile.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd facsimile
    fpm build --profile release
}

package() {
    cd facsimile

    # Find the built binary
    fac_binary=$(find build -name "fac" -type f)

    # Install main binary
    install -Dm755 "$fac_binary" "$pkgdir/usr/bin/fac"

    # Create symlink for convenience
    ln -s fac "$pkgdir/usr/bin/facsimile"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

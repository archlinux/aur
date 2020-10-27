# Maintainer: Aphosis <aphosis.github@gmail.com>
pkgname=gmux
pkgver=0.1.2
pkgrel=1
pkgdesc="Manage multiple git repositories with ease."
url="https://github.com/Aphosis/gmux"
arch=("x86_64")
license=("MIT")
makedepends=("cargo")
provides=("gmux")
source=(https://github.com/Aphosis/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('7e04b9c93e451a5e4f7515056e224c52fe1e1b5fe5dd9dbcd718c3279a445ebcfd779aa3229560fb0a8e14ff1f4b4ea42e5b51373310d34d456566b998cf5d9c')
b2sums=('c717edb85794681c18474be5ddbb3cbfdc5580ac6a504a9792d225cc70a5d3d0928d8635800b3c0285bb2ab6b1417f8b98b1037dedbf01c1925f290bcae1abcb')

build() {
    export CARGO_TARGET_DIR="${srcdir}/${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    export CARGO_TARGET_DIR="${srcdir}/${pkgname}-${pkgver}"
    cd ..
    usrdir="$pkgdir/usr"
    mkdir -p $usrdir
    cargo install --path . --root "$usrdir"
    rm -f $usrdir/.crates.toml
}


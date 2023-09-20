# Maintainer: Christian Holme (Nordwin) <hcmh [at] kolabnow [dot] com>

pkgname=bart-view-git
_pkgname=view
pkgver=0.2.00.r11.g1f0d99d
pkgrel=1
pkgdesc="Small image viewer for multi-dimensional files"
arch=('x86_64')
url="https://github.com/mrirecon/view"
license=('BSD')
depends=('bart' 'gtk3')
makedepends=('git')
source=('view::git+https://github.com/mrirecon/view.git')
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # same logic as in bart-git:
    # cutting off 'v' prefix that presents in the git tag
    # but also use the last tag actually describing a version, which is the latest
    # tag starting with v (for now)
    git describe --match v\* --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "$_pkgname"

    # make sure that we link against bart from the Arch package:
    unset TOOLBOX_PATH
    unset BART_TOOLBOX_PATH

    make 
}

package() {
    cd "$_pkgname"

    # make sure that we link against bart from the Arch package:
    unset TOOLBOX_PATH
    unset BART_TOOLBOX_PATH

    make DESTDIR="$pkgdir" install
   
    # Install license, since each BSD license is technically a custom license
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

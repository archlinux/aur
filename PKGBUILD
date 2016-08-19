# Maintainer: lf (the_lf) <lf at lfcode dot ca>
# Contributor: lygaret
pkgname=lighthouse-git
pkgrel=1
pkgdesc='A simple scriptable popup dialog to run on X'
pkgver=r269.069b07b
arch=('any') # I haven't tested it on ARM but it most likely works
url='https://github.com/emgram769/lighthouse'
license=('MIT')
depends=('libx11' 'libxcb' 'cairo' 'gtk3')
makedepends=('git')
optdepends=('python2: for the included cmd.py')
source=('git://github.com/emgram769/lighthouse.git' lighthouse-git.install)
md5sums=('SKIP'
         'a661ca82623dfb7dcda2bf48ed078ebd')
provides=('lighthouse')
conflicts=('lighthouse') # in case someone makes a stable package

pkgver() {
    cd "lighthouse"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/lighthouse"
    make lighthouse
}

package() {
    cd "${srcdir}/lighthouse"
    mkdir -p ${pkgdir}/usr/{bin,share/lighthouse}
    cp lighthouse "${pkgdir}/usr/bin"
    chmod +x "${pkgdir}/usr/bin/lighthouse"
    cp -ir config/lighthouse/* "${pkgdir}/usr/share/lighthouse"
    chmod +x ${pkgdir}/usr/share/lighthouse/cmd{,.py}
}

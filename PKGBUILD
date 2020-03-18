# Maintainer: Jonathan Tremesaygues <killruana@gmail.com>
pkgname=graywolf-git
pkgver=0.1.6.r184.6c5e24f
pkgrel=3
epoch=
pkgdesc='An opensource placement tool'
arch=('i686' 'x86_64')
url='https://github.com/rubund/graywolf/'
license=('GPL')
provides=('graywolf')
conflicts=('graywolf')
depends=('bash' 'libx11')
makedepends=('cmake' 'gsl' 'git')
source=("git://github.com/rubund/graywolf")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "0.1.6.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make DESTDIR="${pkgdir}" install
    ln -s flow.noroute "${pkgdir}"/usr/lib/graywolf/bin/flow/flow
}

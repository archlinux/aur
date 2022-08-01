# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=plotinus
epoch=1
pkgver=0.2.0+1+g0ce7a4b
pkgrel=1
pkgdesc="A searchable command palette in every modern GTK+ application"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="http://github.com/p-e-w/plotinus"
license=('GPL')
depends=('gtk3')
makedepends=('git' 'vala' 'cmake')
_commit='0ce7a4b98cd9c568ddebfc50ac3ec8392a574e39'
provides=('DBUS-PLOTINUS')
source=("${pkgname}::git+https://github.com/p-e-w/plotinus.git#commit=${_commit}"
        'plotinus.sh')
sha256sums=('SKIP'
            '96fad14ace388edf164b5158adb507765b2bd1fe5c9435c41081ffa8ac2cec11')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r "s/^v//;s/-/+/g"
}

build() {
    cd "${pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 -t "${pkgdir}/etc/profile.d" "${srcdir}"/plotinus.sh
}

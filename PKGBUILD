# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=gitqlient-git
pkgver=v1.4.3.r31.5866f4e
pkgrel=1
pkgdesc="Development branch of GitQlient"
arch=(x86_64)
url="https://github.com/francescmm/GitQlient"
license=('LGPL')
depends=(git qt5-base qt5-webengine qt5-webchannel)
provides=(gitqlient)
conflicts=(gitqlient)
source=("git+https://github.com/francescmm/GitQlient#branch=master")
sha256sums=(SKIP)
_rootdir=GitQlient

pkgver() {
    cd "$_rootdir"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$_rootdir"
    qmake PREFIX="/usr"
    make
}

package() {
    cd "$_rootdir"
    make INSTALL_ROOT="${pkgdir}" install
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/gitqlient"
}

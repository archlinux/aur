# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=gitqlient-git
pkgver=v1.3.0.r50.7df3880
pkgrel=1
pkgdesc="Development branch of GitQlient"
arch=(x86_64)
url="https://github.com/francescmm/GitQlient"
license=('LGPL')
depends=(git qt5-base qt5-webengine qt5-webchannel)
provides=(gitqlient)
conflicts=(gitqlient)
# The branch master is for release and hotfix only
# See https://aur.archlinux.org/packages/gitqlient/#comment-789034
source=("git+https://github.com/francescmm/GitQlient#branch=develop")
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

# Contributor: Eric Fung <loseurmarbles[AT]gmail[DOT]com>
# Contributor: David Birks <david@tellus.space>
# Contributor: Skunnyk <skunnyk@archlinux.fr>

pkgname=castnow-git
_pkgname=${pkgname%-git}
pkgver=0.4.14.r79.g0e1746b
pkgrel=1
pkgdesc="Command-line utility used to play back media files on your Chromecast device"
arch=('any')
url="https://github.com/xat/castnow"
license=('MIT')
depends=('npm')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    npm pack
}

package() {
    cd "${srcdir}/${pkgname}"

    install -d "${pkgdir}/usr"
    npm install -g --prefix="${pkgdir}/usr" castnow-*.tgz
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

_branch=master
_pkgname=acme.sh
pkgname=${_pkgname}-git
pkgver=3.0.4.r31.gf897ab4e
pkgrel=1
pkgdesc='A pure Unix shell script implementing ACME client protocol'
arch=(any)
url='https://github.com/acmesh-official/acme.sh'
license=('GPL3')
makedepends=('git')
depends=('bash')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+https://github.com/acmesh-official/acme.sh.git#branch=${_branch}")
sha512sums=('SKIP')


pkgver() {
    cd "$_pkgname"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"

    install -d "${pkgdir}/usr/share/acme.sh/deploy" "${pkgdir}/usr/share/acme.sh/dnsapi" "${pkgdir}/usr/bin"

    install -Dm755 acme.sh "${pkgdir}/usr/share/acme.sh"
    install -Dm755 deploy/*.sh "${pkgdir}/usr/share/acme.sh/deploy"
    install -Dm755 dnsapi/*.sh "${pkgdir}/usr/share/acme.sh/dnsapi"

    ln -s /usr/share/acme.sh/acme.sh "${pkgdir}/usr/bin/acme.sh"
}

# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

_branch=master
_pkgname=acme.sh
pkgname=${_pkgname}-git
pkgver=3.1.1.r25.g42bbd1b4
pkgrel=2
pkgdesc='A pure Unix shell script implementing ACME client protocol'
arch=('any')
url='https://github.com/acmesh-official/acme.sh'
license=('GPL3')
depends=('bash')
makedepends=('git')
optdepends=('socat: for standalone mode'
            'oath-toolkit: Used to compute the OTP for some DNS providers'
            'yq: for multideploy deploy plugin')
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

    install -dm755 "${pkgdir}/usr/share/${_pkgname}/deploy" \
                   "${pkgdir}/usr/share/${_pkgname}/dnsapi" \
                   "${pkgdir}/usr/share/${_pkgname}/notify" \
                   "${pkgdir}/usr/bin"

    install -Dm755 ${_pkgname} "${pkgdir}/usr/share/${_pkgname}/"
    install -Dm755 deploy/*.sh "${pkgdir}/usr/share/${_pkgname}/deploy/"
    install -Dm755 dnsapi/*.sh "${pkgdir}/usr/share/${_pkgname}/dnsapi/"
    install -Dm755 notify/*.sh "${pkgdir}/usr/share/${_pkgname}/notify/"

    ln -s /usr/share/${_pkgname}/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}

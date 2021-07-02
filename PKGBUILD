# Ex-Maintainer: Leonardo Eugenio <lelgenio@disroot.org>
# Mantainer: Darvin Delgado <dnmodder at gmail dot com>
pkgname=mscs
pkgver=20.09.01
pkgrel=1
pkgdesc="Powerful command-line control for UNIX and Linux powered Minecraft servers"
arch=('any')
url="https://github.com/MinecraftServerControl/mscs"
license=('BSD')
depends=('screen' 'perl-json' 'perl-lwp-protocol-https' 'java-runtime' 'rdiff-backup' 'rsync' 'socat')
makedepends=(make git)
optdepends=(
    'python: Overviewer mapping tool'
    'iptables: Recommended firewall'
)
install=mscs.install
source=(
    "${pkgname}-v.${pkgver}.tar.gz::${url}/archive/refs/tags/v.${pkgver}.tar.gz"
    "mscs.install"
    "mscs.patch")
md5sums=('c6570eea198f62cdaf178bd6baa5855b'
         '197c788a097a5c2d087935c69db67fa1'
         '8e275fb7b81308361f44cc1d2ca7e7bb')

prepare() {
	cd "${srcdir}/${pkgname}-v.${pkgver}"
	patch -p1 -i "${srcdir}/mscs.patch"
}

package() {
    cd "${srcdir}/${pkgname}-v.${pkgver}"
    make DESTDIR="${pkgdir}/" install
}

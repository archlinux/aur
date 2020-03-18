# Maintainer: Florian Schweikert <kelvan@ist-total.org>

pkgname=dput-ng-git
_gitname=dput-ng
_foldername=${_gitname}
pkgver=1.29
pkgrel=1
pkgdesc='like dput, but better'
url='http://dput-ng.debian.net/'
makedepends=('python2-setuptools')
depends=('python2-debian')
license=('GPL')
arch=('any')
provides=('dput')
conflicts=('dput')
source=("git+https://salsa.debian.org/debian/${_gitname}.git")
sha1sums=('SKIP')

build() {
    cd "${srcdir}/${_foldername}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${_foldername}"
    git checkout -f ${pkgver}
    python3 setup.py install --skip-build -O1 --root="$pkgdir"
    install -d "${pkgdir}/usr/bin"
    install "${srcdir}"/${_foldername}/bin/* "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/etc/dput.d/"
    install "${srcdir}"/${_foldername}/skel/metas/* "${pkgdir}/etc/dput.d/"
    install "${srcdir}"/${_foldername}/skel/profiles/* "${pkgdir}/etc/dput.d/"
    install -d "${pkgdir}/usr/share/dput-ng/"
    cp -r "${srcdir}"/${_foldername}/skel/hooks "${pkgdir}/usr/share/dput-ng/"
    cp -r "${srcdir}"/${_foldername}/skel/commands "${pkgdir}/usr/share/dput-ng/"
    cp -r "${srcdir}"/${_foldername}/skel/interfaces "${pkgdir}/usr/share/dput-ng/"
    cp -r "${srcdir}"/${_foldername}/skel/uploaders "${pkgdir}/usr/share/dput-ng/"
    cp -r "${srcdir}"/${_foldername}/skel/schemas "${pkgdir}/usr/share/dput-ng/"
    cp -r "${srcdir}"/${_foldername}/skel/codenames "${pkgdir}/usr/share/dput-ng/"
}

# Maintainer: Florian Schweikert <kelvan@ist-total.org>

pkgname=dput-ng-git
_gitname=dputng
pkgver=1.11
pkgrel=1
pkgdesc='like dput, but better'
url='http://dput-ng.debian.net/'
makedepends=('python2-setuptools')
depends=('python2-debian')
license=('GPL')
arch=('any')
provides=('dput')
conflicts=('dput')
source=("git://anonscm.debian.org/collab-maint/${_gitname}.git")
sha1sums=('SKIP')

build() {
    cd "${srcdir}/${_gitname}"
    python2 setup.py build
    sed -i 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/' bin/*
}

package() {
    cd "${srcdir}/${_gitname}"
    git checkout ${pkgver}
    python2 setup.py install --skip-build -O1 --root="$pkgdir"
    install -d "${pkgdir}/usr/bin"
    install "${srcdir}"/${_gitname}/bin/* "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/etc/dput.d/"
    install "${srcdir}"/${_gitname}/skel/metas/* "${pkgdir}/etc/dput.d/"
    install "${srcdir}"/${_gitname}/skel/profiles/* "${pkgdir}/etc/dput.d/"
    install -d "${pkgdir}/usr/share/dput-ng/"
    cp -r "${srcdir}"/${_gitname}/skel/hooks "${pkgdir}/usr/share/dput-ng/"
    cp -r "${srcdir}"/${_gitname}/skel/commands "${pkgdir}/usr/share/dput-ng/"
    cp -r "${srcdir}"/${_gitname}/skel/interfaces "${pkgdir}/usr/share/dput-ng/"
    cp -r "${srcdir}"/${_gitname}/skel/uploaders "${pkgdir}/usr/share/dput-ng/"
    cp -r "${srcdir}"/${_gitname}/skel/schemas "${pkgdir}/usr/share/dput-ng/"
    cp -r "${srcdir}"/${_gitname}/skel/codenames "${pkgdir}/usr/share/dput-ng/"
}

# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname=bash-common-environment
pkgver=0.0.1
pkgrel=1
pkgdesc=Sets\ common\ environment\ variables\ for\ a\ Bash\ library\ on\ Linux
arch=(any)
url=https://github.com/vinsonchuong/bash-common-environment
license=(MIT)
depends=(bash-common-parse-options)
makedepends=(clidoc)
checkdepends=(bats-git)
source=(https://github.com/vinsonchuong/bash-common-environment/archive/v0.0.1-1.tar.gz)
md5sums=('daf8f3a5585f88f116101bf4004efda5')
build () 
{ 
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}";
    clidoc doc/*.md
}
check () 
{ 
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}";
    PATH="$(realpath 'bin'):${PATH}"bats spec
}
package () 
{ 
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}";
    [ -d 'bin' ] && install -Dm755 -t "${pkgdir}/usr/bin" bin/*;
    [ -d 'help' ] && install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/help" help/*;
    [ -f 'README.md' ] && install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md';
    [ -d 'doc' ] && install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/doc" doc/*.md;
    [ -f 'LICENSE' ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE';
    [ -d 'man' ] && install -Dm644 -t "${pkgdir}/usr/share/man/man1" man/*
}

# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname=bash-common-bundle-dependencies
pkgver=0.0.2
pkgrel=1
pkgdesc=Locally\ install\ package\ dependencies
arch=(any)
url=https://github.com/vinsonchuong/bash-common-bundle-dependencies
license=(MIT)
depends=(git)
makedepends=(clidoc)
checkdepends=(bats-git)
source=(https://github.com/vinsonchuong/bash-common-bundle-dependencies/archive/v0.0.2-1.tar.gz)
md5sums=('314a82089e7282663317d4e54a584545')
build () 
{ 
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}";
    clidoc doc/*.md
}
check () 
{ 
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}";
    PATH="${PWD}/bin:${PATH}" bats spec
}
package () 
{ 
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}";
    [[ -d 'bin' ]] && install -Dm755 -t "${pkgdir}/usr/bin" bin/*;
    [[ -d 'lib' ]] && install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}" lib/*;
    [[ -d 'help' ]] && install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/help" help/*;
    [[ -f 'README.md' ]] && install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md';
    [[ -d 'doc' ]] && install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/doc" doc/*.md;
    [[ -f 'LICENSE' ]] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE';
    [[ -d 'man' ]] && install -Dm644 -t "${pkgdir}/usr/share/man/man1" man/*
}

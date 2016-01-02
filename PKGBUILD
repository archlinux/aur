# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname=gitetc
pkgver=0.0.3
pkgrel=1
pkgdesc=Scripts\ to\ help\ you\ track\ changes\ to\ your\ /etc\ files
arch=(any)
url=https://github.com/vinsonchuong/gitetc
license=(MIT)
depends=(git)
makedepends=(clidoc)
source=(https://github.com/vinsonchuong/gitetc/archive/v0.0.3-1.tar.gz)
md5sums=('a75223c34e36c214ab4ef4739301c514')
build () 
{ 
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}";
    if [[ -d 'doc' ]]; then
        clidoc doc/*.md;
    fi
}
check () 
{ 
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}";
    if [[ -d 'spec' ]]; then
        bats spec;
    fi
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

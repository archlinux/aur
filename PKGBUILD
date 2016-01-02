# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname=transmission-utils
pkgver=0.0.3
pkgrel=1
pkgdesc=A\ set\ of\ command-line\ scripts\ that\ automate\ common\ tasks\ in\ Transmission
arch=(any)
url=https://github.com/vinsonchuong/transmission-utils
license=(MIT)
depends=(transmission-cli)
makedepends=(clidoc)
source=(https://github.com/vinsonchuong/transmission-utils/archive/v0.0.3-1.tar.gz)
md5sums=('b111e50b8318baac8a3c78edb371ce3d')
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

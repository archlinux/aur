# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname=gitaur
pkgver=0.1.6
pkgrel=1
pkgdesc=A\ set\ of\ command-line\ scripts\ that\ automate\ common\ tasks\ in\ maintaining\ AUR\ packages\ on\ GitHub
arch=(any)
url=https://github.com/vinsonchuong/gitaur
license=(MIT)
depends=(
	aura
	bash-common-parse-options
	hub
	jq
	namcap
	ninka
	pkgbuild-introspection
)
makedepends=(clidoc)
source=(https://github.com/vinsonchuong/gitaur/archive/v0.1.6-1.tar.gz)
md5sums=('434ed063434cc55e0c94ed40533dd03d')
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

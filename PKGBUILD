# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname=gitaur
pkgver=0.1.7
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
source=(https://github.com/vinsonchuong/gitaur/archive/v0.1.7-1.tar.gz)
md5sums=('91ed16725717d1d9231519c85011c9b6')
build () 
{ 
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}";
    clidoc doc/*.md
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

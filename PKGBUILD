# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname=prototypical
pkgver=0.0.3
pkgrel=1
pkgdesc=A\ starting\ point\ for\ a\ project
arch=(any)
url=https://github.com/vinsonchuong/prototypical
license=(MIT)
depends=(
	bash-common-environment
	bash-common-parse-options
	postgresql
	perl
	ruby
	nodejs
	npm
)
optdepends=(hub)
makedepends=(
	bats-git
	git
)
checkdepends=(bats-git)
source=(https://github.com/vinsonchuong/prototypical/archive/v0.0.3-1.tar.gz)
md5sums=('6050e566342d250aa8aec016e742176b')
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

# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname=prototypical
pkgver=0.0.7
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
makedepends=(clidoc)
checkdepends=(
	bats-git
	git
)
source=(https://github.com/vinsonchuong/prototypical/archive/v0.0.7-1.tar.gz)

md5sums=("SKIP")
build () 
{ 
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}";
    clidoc doc/*.md
}
check () 
{ 
    true
}
package () 
{ 
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}";
    [[ -d 'bin' ]] && install -Dm755 -t "${pkgdir}/usr/bin" bin/*;
    if [[ -d 'lib' ]]; then
        for file in $(find 'lib' -type 'f');
        do
            install -D -m "$(stat -c '%a' "$file")" "$file" "${pkgdir}/usr/lib/${pkgname}/${file#'lib/'}";
        done;
    fi;
    [[ -d 'help' ]] && install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/help" help/*;
    [[ -f 'README.md' ]] && install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md';
    [[ -d 'doc' ]] && install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/doc" doc/*.md;
    [[ -f 'LICENSE' ]] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE';
    [[ -d 'man' ]] && install -Dm644 -t "${pkgdir}/usr/share/man/man1" man/*
}

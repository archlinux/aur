# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname="prototypical"
pkgver="0.0.1"
pkgrel="1"
pkgdesc="A\ starting\ point\ for\ a\ project"
arch=("any")
url="https://github.com/vinsonchuong/prototypical"
license=("MIT")
depends=(
	"bash-common-parse-options"
	"perl"
	"ruby"
	"nodejs"
	"npm"
)
optdepends=("hub")
makedepends=("clidoc")
checkdepends=("bats-git")
source=("https://github.com/vinsonchuong/prototypical/archive/v0.0.1-1.tar.gz")
md5sums=('2aca29684ffc14c17bd5eac6fb2cefe2')
build () 
{ 
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}";
    if [ -d 'doc' ]; then
        clidoc doc/*.md;
    fi
}
check () 
{ 
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}";
    if [ -d 'spec' ]; then
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

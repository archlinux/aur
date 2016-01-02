# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname=clidoc
pkgver=0.0.2
pkgrel=1
pkgdesc=Generate\ man\ pages\ and\ help\ text\ from\ Markdown-formatted\ docs
arch=(any)
url=https://github.com/vinsonchuong/clidoc
license=(MIT)
depends=(
	bash-common-parse-options
	ruby-ronn
	xidel
)
source=(https://github.com/vinsonchuong/clidoc/archive/v0.0.2-1.tar.gz)
md5sums=('0ea95024814254553ec3fbf1c59f1dcc')
build () 
{ 
    cd "$srcdir/$pkgname-$pkgver-$pkgrel";
    [ -d 'doc' ] && bin/clidoc doc/*.md
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

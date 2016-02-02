# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname=clidoc
pkgver=0.0.3
pkgrel=1
pkgdesc=Generate\ man\ pages\ and\ help\ text\ from\ Markdown-formatted\ docs
arch=(any)
url=https://github.com/vinsonchuong/clidoc
license=(MIT)
depends=(
	ruby-ronn
	xidel
)
source=(https://github.com/vinsonchuong/clidoc/archive/v0.0.3-1.tar.gz)
md5sums=('87793ed0d132d6d77790e192be969ee7')
build () 
{ 
    cd "$srcdir/$pkgname-$pkgver-$pkgrel";
    [ -d 'doc' ] && bin/clidoc doc/*.md
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

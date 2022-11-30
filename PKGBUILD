# Maintainer: Bipin Kumar <bipin@ccmb.res.in>
pkgname=cdbfasta-git 
pkgver=r4.014498c
pkgrel=1
pkgdesc="CDB (Constant DataBase) indexing and retrieval tools for FASTA files"
arch=(x86_64)
url="https://github.com/gpertea/cdbfasta"
license=('Artistic2.0')
makedepends=('git')
depends=('gcc-libs' 'zlib')
provides=(""${pkgname%-VCS}"")
source=(''cdbfasta-git::git+https://github.com/gpertea/cdbfasta.git'')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	make
}

package() {
	cd "$srcdir/${pkgname}"
	for bin in {cdbfasta,cdbyank}
  do
    install -D -m755 "${srcdir}/$pkgname/${bin}" "$pkgdir"/usr/bin/${bin}
  done

}

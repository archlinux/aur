# Maintainer: Frank Seifferth <frankseifferth@posteo.net>

pkgname=pdsite-git
_pkgname=pdsite
pkgver=latest
pkgrel=1
pkgdesc="Pandoc-backed static site generator shell script with precompiled binary dependencies."
arch=('any')
url="https://github.com/GordStephen/pdsite"
depends=('pandoc' 'tree')
makedepends=('git')
optdepends=('webfs')
source=("$pkgname::git+https://github.com/GordStephen/pdsite" "binlink")
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
	echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    mkdir -p "$pkgdir/usr/share/pdsite"
	cp -r $pkgname/* "$pkgdir/usr/share/pdsite/"
	cp -r $pkgname/.pdsite.yml.default "$pkgdir/usr/share/pdsite/"
    install -D -m 755 "$srcdir/binlink" "$pkgdir/usr/bin/pdsite"
}

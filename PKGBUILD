#Maintainer: Trevor Bergeron <mal@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-bin

_pkgver=1.9.0
pkgver="${_pkgver//-/_}"
pkgrel=1

pkgdesc="UI for A decentralized, privacy-preserving, multi-party messaging protocol client (binary distribution)"
provides=('cwtch')
conflicts=('cwtch' 'cwtch-git' 'libcwtch-go')
arch=('x86_64')
url='https://cwtch.im'
license=('MIT')
optdepends=(
    'tor: use system tor instead of packaged'
)
source_x86_64=("$url/releases/$_pkgname-v${_pkgver%.0}/$_pkgname-v$_pkgver.tar.gz")
sha512sums_x86_64=('8a1eb086199b73d0295a683776a26d15df72d4d314ce6b14445a077a3116ce6cc1ea75bce878f4a716ed093bc924394a762af8edfb73d72febe57a438d3b524a')

package() {
    cd "$srcdir/$_pkgname"

    # See install-sys.sh
    install -Dm0755 "cwtch.sys.sh" "$pkgdir/usr/bin/cwtch"
    install -Dm0644 cwtch.png -t "$pkgdir/usr/share/icons/"
    install -dm0755 "$pkgdir/usr/share/cwtch/"
    cp -r data "$pkgdir/usr/share/cwtch/"
    install -dm0755 "$pkgdir/usr/lib/cwtch/"
    cp -r lib/* "$pkgdir/usr/lib/cwtch/"
    install -Dm0644 cwtch.sys.desktop "$pkgdir/usr/share/applications/cwtch.desktop"
}

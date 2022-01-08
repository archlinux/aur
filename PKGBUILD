#Maintainer: Trevor Bergeron <mal@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-bin

_pkgver=1.5.2
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
source_x86_64=("$url/releases/$_pkgname-v${_pkgver}/$_pkgname-v$_pkgver.tar.gz")
sha512sums_x86_64=('887f67a3a0a4b8fbe4c2510644ecf449cf76594c1cb73b2f3afa0388c51a3bf8303e96bda995064728591b31418c78a10a4802d3d4d60c01f94d5ce3c9175d18')

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

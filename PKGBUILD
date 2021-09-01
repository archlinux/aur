#Maintainer: Trevor Bergeron <mal@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-bin

_pkgver=1.2.0
pkgver="${_pkgver//-/_}"
pkgrel=1

pkgdesc="A decentralized, privacy-preserving, multi-party messaging protocol client (binary distribution)"
provides=('libcwtch-go')
conflicts=('cwtch' 'cwtch-git' 'libcwtch-go')
arch=('x86_64')
url='https://cwtch.im'
license=('MIT')
optdepends=(
    'tor: use system tor instead of packaged'
)
source_x86_64=("$url/releases/$_pkgname-v${_pkgver%.*}/$_pkgname-v$_pkgver.tar.gz")
sha512sums_x86_64=('4a904b6778c1c4bc81db57111fbd60197e5ccae4953502aff7e2405f8d7d0c5a5b89ffbffe806723f2174d66a632f388e598e83e4df3713bcde0c1b4979e2b70')

package() {
    cd "$srcdir/$_pkgname"

    # See install-sys.sh
    install -Dm0755 "cwtch.sys.sh" "$pkgdir/usr/bin/cwtch"
    install -Dm0644 cwtch.png -t "$pkgdir/usr/share/icons/"
    install -dm0755 "$pkgdir/usr/share/cwtch/"
    cp -r data "$pkgdir/usr/share/cwtch/"
    install -dm0755 "$pkgdir/usr/lib/cwtch/"
    #install -Dm0755 cwtch -t "$pkgdir/usr/lib/cwtch/"
    cp -r lib/* "$pkgdir/usr/lib/cwtch/"
    install -Dm0644 cwtch.sys.desktop "$pkgdir/usr/share/applications/cwtch.desktop"
}

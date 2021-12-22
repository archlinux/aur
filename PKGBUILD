#Maintainer: Trevor Bergeron <mal@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-bin

_pkgver=1.5.1
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
sha512sums_x86_64=('0c8b05d887b1755c60c2feebcc16d26b57bb86364c37e40444a8d8f934aa219717d66763cbcc17ea41fd29bd402e3a1b0fbd1b16bf80d90a9a83ceea03787c39')

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

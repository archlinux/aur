#Maintainer: Trevor Bergeron <mal@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-bin

_pkgver=1.7.0
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
sha512sums_x86_64=('5537e44d96ae91619d2524a25dd2403f1604cc06e095f7a36d61267943c0f8ed8227e806d10baf5a7cf3aa79f850ba72af975ad49f258fe2b9b4463d7a092360')

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

#Maintainer: Trevor Bergeron <mal@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-bin

_pkgver=1.0.0-16-gb1f81e4
pkgver="${_pkgver//-/_}"
pkgrel=1

pkgdesc="A decentralized, privacy-preserving, multi-party messaging protocol client (binary distribution)"
conflicts=('cwtch' 'cwtch-git')
arch=('x86_64')
url='https://cwtch.im'
license=('MIT')
source=("launch-cwtch.sh")
source_x86_64=("$url/releases/$_pkgname-v$_pkgver/$_pkgname-v$_pkgver.tar.gz")
sha512sums=('8d947083bf4f0b4c90d3f714e36c8d59dadf1f7d9599eb226cfd080f7c492fd5ca0a4f423589a20336d8307d9776486bf17105e4f316852581581da3305e55aa')
sha512sums_x86_64=('262a1ed3dfd36be3544d78d256fd658edf94371eadfa3691f564971c4e63be2d0a77c5cd4474c0a9ef89c79dc645e18aa657973b5060495eb0da77f4489064d4')

package() {
    cd "$srcdir/$_pkgname"

    install -Dm0755 "$srcdir/launch-cwtch.sh" "$pkgdir/usr/bin/cwtch"

    # See install-sys.sh
    install -Dm0644 cwtch.png -t "$pkgdir/usr/share/icons/"
    install -dm0755 "$pkgdir/usr/share/cwtch/"
    cp -r data "$pkgdir/usr/share/cwtch/"
    install -dm0755 "$pkgdir/usr/lib/cwtch/"
    install -Dm0755 cwtch -t "$pkgdir/usr/lib/cwtch/"
    cp -r lib/* "$pkgdir/usr/lib/cwtch/"
    # We wrap `cwtch` so it works without launching via the .desktop file
    sed -re 's,Exec=.*,Exec=/usr/bin/cwtch,' -i cwtch.sys.desktop
    install -Dm0644 cwtch.sys.desktop "$pkgdir/usr/share/applications/cwtch.desktop"
}

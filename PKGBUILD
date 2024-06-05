# Maintainer: Thomas Holden <thomas@tholden.no>

# This PKGBUILD is forked from https://aur.archlinux.org/packages/tableplus due to lack of updating.

pkgname=tableplus-bin
pkgver=0.1.254
pkgrel=1
pkgdesc='Modern, native, and friendly GUI tool for relational databases (Alpha)'
arch=('x86_64' 'aarch64')
conflicts=('tableplus')
url='https://tableplus.com/'
license=('custom')
depends=('gtksourceview3' 'libgee' 'gnome-keyring')
source=('LICENSE' 'tableplus.desktop')
source_x86_64=("tableplus_${pkgver}_${pkgrel}_amd64.deb::https://deb.tableplus.com/debian/22/pool/main/t/tableplus/tableplus_${pkgver}_amd64.deb")
source_aarch64=("tableplus_${pkgver}_${pkgrel}_arm64.deb::https://deb.tableplus.com/debian/22-arm/pool/main/t/tableplus/tableplus_${pkgver}_arm64.deb")

sha256sums=('76f924b1ebad5309ccf0dd7f3fe3d1b57ff3088b208a603900b0e240fdb5debb'
            '83620b08e325418947f0007ecca7b981a988bfdac3f466db165f9262d1c0e5f4')
sha256sums_x86_64=('882d148c37ad567bac931080c0b6f94931b5e60a245b438a27fee9ec74c51e0b')
sha256sums_aarch64=('e47e1eec33847f37b9cd903da8c5e2e80bf957493925ceaa61f19ccc39b6c2c8')

prepare() {
    tar -xf "${srcdir}/data.tar.zst"
}

package() {
    install -d $pkgdir/opt/tableplus $pkgdir/usr/local/bin
    install -Dm755 $srcdir/opt/tableplus/tableplus -t $pkgdir/opt/tableplus/
    install -m755 $srcdir/opt/tableplus/tableplus -t $pkgdir/opt/tableplus/
    install -Dm644 $srcdir/opt/tableplus/tableplus.desktop -t $pkgdir/usr/share/applications/
    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    cp -r $srcdir/opt/tableplus/resource $pkgdir/opt/tableplus/
    echo -e '#!/bin/sh\n/opt/tableplus/tableplus "$@"' >$pkgdir/usr/local/bin/tableplus
    chmod 755 $pkgdir/usr/local/bin/tableplus
}

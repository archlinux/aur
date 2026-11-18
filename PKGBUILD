# Maintainer: Lucas Saliés Brum <sistematico at gmail dot com>
# Contributor: Ethan Reece <aur at ethanreece dot com>
# Contributor: Loopsmark <loopsmark at merkur dot pm>
# Contributor: Winston Astrachan <winston dot astrachan at gmail dot com>
# Contributor: Henry Pham <huy at tableplus dot com>

pkgname=tableplus
pkgver=2.2.2
pkgrel=1
_debchannel=24
_debrel=324
pkgdesc='Modern, native, and friendly GUI tool for relational databases (Alpha)'
arch=('x86_64' 'aarch64')
url='https://tableplus.com/'
license=('custom')
depends=('gtksourceview3' 'libgee' 'gnome-keyring')
source=('LICENSE' 'tableplus.desktop')
source_x86_64=("tableplus_${pkgver}-${_debrel}_amd64.deb::https://deb.tableplus.com/debian/${_debchannel}/pool/main/t/tableplus/tableplus_${pkgver}-${_debrel}_amd64.deb")
source_aarch64=("tableplus_${pkgver}_${_debrel}_arm64.deb::https://deb.tableplus.com/debian/${_debchannel}-arm/pool/main/t/tableplus/tableplus_${pkgver}-${_debrel}_arm64.deb")
sha256sums=('76f924b1ebad5309ccf0dd7f3fe3d1b57ff3088b208a603900b0e240fdb5debb'
            '83620b08e325418947f0007ecca7b981a988bfdac3f466db165f9262d1c0e5f4')
sha256sums_x86_64=('3655a6e9d5a8871966c27974f925ed3c33e279a5313e6aa1b3e22ba312f6b424')
sha256sums_aarch64=('040e8eb673f017751da7483a9e925bea99250b7eb06f066bc74c71fe7848759f')

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

# Maintainer: Lucas Saliés Brum <sistematico at gmail dot com>
# Contributor: Ethan Reece <aur at ethanreece dot com>
# Contributor: Loopsmark <loopsmark at merkur dot pm>
# Contributor: Winston Astrachan <winston dot astrachan at gmail dot com>
# Contributor: Henry Pham <huy at tableplus dot com>

pkgname=tableplus
pkgver=2.0.2
pkgrel=1
_debchannel=24
_debrel=320
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
sha256sums_x86_64=('5028e7be56606db756836fea1a7debb4ec77dd7cda7c3e191901c21dd14c94d2')
sha256sums_aarch64=('bcbf7135c597d37816b0bf4330975fcf986e975f4be7b3786f0b9c9a2ba30de3')

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

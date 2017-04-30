# Maintainer: Carl George < arch at cgtx dot us >

_name='gnome-shell-impatience'
_owner='timbertson'
_uuid='impatience@gfxmonk.net'

pkgname='gnome-shell-extension-impatience'
pkgver=0.4.3
_tag="version-$pkgver"
pkgrel=1
pkgdesc='Speed up the gnome-shell animation speed'
arch=('any')
url="https://github.com/$_owner/$_name"
license=('GPL3')
source=("$url/archive/$_tag.tar.gz"
        "$url/commit/4903eaa.patch"
        'shell-versions.patch')
sha256sums=('6fcfd5431d9b07a1092c77b508f7950385822c367c61d6fb2087a89996c4136c'
            'e5e4aec23e10a3a99b06b30b595556e80bc3c02aace752ea32f439be03404516'
            '46dc37855878c3ec368db6817036d1c2458d8c953b53bfd5fe180a547533c06c')

prepare() {
    cd $_name-$_tag
    patch -p1 -i "$srcdir/4903eaa.patch"
    patch -p1 -i "$srcdir/shell-versions.patch"
}

package() {
    depends=('gnome-shell')
    cd $_name-$_tag
    install --directory --mode 0755 "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
    cp -r impatience/* "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}

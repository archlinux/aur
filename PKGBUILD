# Maintainer: J. Nathanael Philipp <jnathanael@philipp.land>
pkgname=gnome-shell-extension-quick-lofi
pkgver=1.10.1
pkgrel=1
pkgdesc='Play lofi music and other sounds, locally or online, on your GNOME desktop with just a click!'
arch=('any')
url="https://github.com/EuCaue/gnome-shell-extension-quick-lofi"
license=('GPL-3.0-only')
depends=('gnome-shell' 'mpv')
makedepends=('jq')
source=(
    "https://github.com/EuCaue/gnome-shell-extension-quick-lofi/releases/download/v${pkgver}/quick-lofi@eucaue.zip"
    "https://raw.githubusercontent.com/EuCaue/gnome-shell-extension-quick-lofi/refs/heads/master/LICENSE"
)
sha256sums=(
    "c955185e0d452e8739249484c71b24772f0f67a39a0ae09de5b03bb5398e8bed"
    "d9b35296af104bd3ee62939b8d80ab8db7fe0aa61b30d2fe14acb2704904d299"
)

package() {
    _uuid=$(jq -r .uuid "${srcdir}/metadata.json")
    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    bsdtar xf "${srcdir}/quick-lofi@eucaue.zip" -C "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner
    install -m644 "${srcdir}/metadata.json" "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${srcdir}/schemas/org.gnome.shell.extensions.quick-lofi.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
    rm -rf "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}

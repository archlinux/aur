#Maintainer: Ayrton Araujo <root@ayr-ton.net>

pkgname=franz
pkgver=3.0.0
_gittag=3.0.0
pkgrel=1
pkgdesc='A free messaging app for WhatsApp, Facebook Messenger, Telegram, Slack and more.'
arch=('i686' 'x86_64')
depends=('alsa-lib' 'bash' 'desktop-file-utils' 'gconf' 'gtk2' 'libnotify' 'libxtst' 'nss')
makedepends=('tar')
url='http://meetfranz.com/'
license=('custom:github')
source=("${pkgname}.sh" "${pkgname}.desktop" "${pkgname}.png")
source_i686=("https://github.com/imprecision/franz-app/releases/download/$_gittag/Franz-linux-ia32-$pkgver.tgz")
source_x86_64=("https://github.com/imprecision/franz-app/releases/download/$_gittag/Franz-linux-x64-$pkgver.tgz")
sha256sums=('5d53c349bcf0452a31e3aee609eac6809f26750f4fb4da049132adc5c9a40289'
            'c63052b7ada73dbc984f55afc6d0ad937bf57ae5b0b41b560ef46937afeb81c5'
            '6e761371afadf155b8bc25e94fd7de371c16130a87338300e5800924916a7a28')
sha256sums_i686=('33a030644e20b13406eec5369f070597f8b6940df14c7bc70e1d204a39a21873')
sha256sums_x86_64=('61b60fde3ef951e8f99b3deae992195994300b13da368cd999fc332c8023b0d1')
[[ "$CARCH" = "i686" ]] && _path="Franz-linux-ia32-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _path="Franz-linux-x64-${pkgver}"
noextract=(${_path})

prepare() {
    install -d ${srcdir}/${_path}/
    tar xf "${srcdir}/${_path}.tgz" -C "${srcdir}/${_path}"
}

package() {
    install -d ${pkgdir}/{opt/franz,usr/{bin,share/pixmaps}}
    cp -R ${srcdir}/${_path}/* ${pkgdir}/opt/${pkgname}/
    install -Dm755 $srcdir/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 $srcdir/${pkgname}.png ${pkgdir}/usr/share/pixmaps/franz.png
    desktop-file-install ${srcdir}/${pkgname}.desktop --dir ${pkgdir}/usr/share/applications/
}

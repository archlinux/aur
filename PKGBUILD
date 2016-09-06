#Maintainer: Marc Jose <Hering2007@web.de>
#Contributor: Ayrton Araujo <root@ayr-ton.net>

#namcap PKGBUILD
#makepkg --printsrcinfo > .SRCINFO

pkgname=franz
pkgver=4.0.3
pkgrel=1
pkgdesc='A free messaging app for WhatsApp, Facebook Messenger, Telegram, Slack and more.'
arch=('i686' 'x86_64')
depends=('alsa-lib' 'bash' 'desktop-file-utils' 'gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'libxss')
makedepends=('tar')
url='http://meetfranz.com/'
license=('custom:file')
source=("${pkgname}.sh" "${pkgname}.desktop" "${pkgname}.png" "${pkgname}.LICENSE")
source_i686=("https://github.com/imprecision/franz-app/releases/download/$pkgver/Franz-linux-ia32-$pkgver.tgz")
source_x86_64=("https://github.com/imprecision/franz-app/releases/download/$pkgver/Franz-linux-x64-$pkgver.tgz")
sha256sums=('5d53c349bcf0452a31e3aee609eac6809f26750f4fb4da049132adc5c9a40289'
            'c63052b7ada73dbc984f55afc6d0ad937bf57ae5b0b41b560ef46937afeb81c5'
            '6e761371afadf155b8bc25e94fd7de371c16130a87338300e5800924916a7a28'
            'f99c2ecb2bc00e05690dbfd62dbe6a0253ec4e156b097ed79e3cec7c820fbfd8')
sha256sums_i686=('118346c4649b5b562e138fbdace63481dd3c0e6647efbe3408c241dea3e03396')
sha256sums_x86_64=('6cc66a8742d2f14845f080733d234ff756069910b69bf94ff3d5b4d7c05cf641')
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
    install -Dm644 $srcdir/${pkgname}.LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    desktop-file-install ${srcdir}/${pkgname}.desktop --dir ${pkgdir}/usr/share/applications/
}

#Maintainer: Marc Jose <Hering2007@web.de>
#Contributor: Lars Jose <larsjose77@gmail.com>
pkgname=franz-bin
pkgver=4.0.4
pkgrel=5
pkgdesc='Franz is a free messaging app / former Emperor of Austria and combines chat & messaging services into one application. Franz currently supports Slack, WhatsApp, WeChat, HipChat, Facebook Messenger, Telegram, Google Hangouts, GroupMe, Skype and many more.'
arch=('i686' 'x86_64')
depends=('alsa-lib' 'bash' 'desktop-file-utils' 'gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'libxss')
makedepends=('tar')
url='http://meetfranz.com/'
license=('custom:github' 'MIT' 'ISC')
source=("${pkgname}.sh" "${pkgname}.desktop" "${pkgname}.png" "LICENSE" "CHANGELOG")
source_i686=("https://github.com/meetfranz/franz-app/releases/download/$pkgver/Franz-linux-ia32-$pkgver.tgz")
source_x86_64=("https://github.com/meetfranz/franz-app/releases/download/$pkgver/Franz-linux-x64-$pkgver.tgz")
sha256sums=('e21d21df5781413e416f8955d09d20dfa9e96d845c0be113796ceba529fb56f2'
            '7e2a87980efe24f4bd725169cfb00309349d2d3202bbe50735ff5ac508383a16'
            '6e761371afadf155b8bc25e94fd7de371c16130a87338300e5800924916a7a28'
            'f99c2ecb2bc00e05690dbfd62dbe6a0253ec4e156b097ed79e3cec7c820fbfd8'
            'dd0d0fd89d6f3bcdc1e318e910509035204b461a553ff0d32127e37b25692e0c')
sha256sums_i686=('de47566b0de0a4ba966300e7708462bd3eb662e619fa4068a29f47285495899a')
sha256sums_x86_64=('65e63c9aa71c46f391ce5b62bca0b77dcae59d0cef18691e39e4c5ec24a85e6b')
[[ "$CARCH" = "i686" ]] && _path="Franz-linux-ia32-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _path="Franz-linux-x64-${pkgver}"
noextract=(${_path})

prepare() {
    install -d ${srcdir}/${_path}/
    tar xf "${srcdir}/${_path}.tgz" -C "${srcdir}/${_path}"
}

package() {
    install -d ${pkgdir}/{opt/franz-bin,usr/{bin,share/pixmaps}}
    cp -R ${srcdir}/${_path}/* ${pkgdir}/opt/${pkgname}/
    install -Dm755 $srcdir/${pkgname}.sh  ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 $srcdir/${pkgname}.png ${pkgdir}/usr/share/pixmaps/franz.png
    install -Dm644 $srcdir/LICENSE        ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 $srcdir/CHANGELOG      ${pkgdir}/opt/${pkgname}/CHANGELOG
    desktop-file-install ${srcdir}/${pkgname}.desktop --dir ${pkgdir}/usr/share/applications/
}

# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electerm-git
pkgver=r1492.71ee90a7
pkgrel=1
pkgdesc="Terminal/ssh/telnet/serialport/sftp client(linux, mac, win)"
arch=('any')
url="https://electerm.html5beta.com/"
_githuburl="https://github.com/electerm/electerm"
license=('MIT')
makedepends=('npm' 'git' 'nodejs>=16.0.0' 'gendesk')
depends=('bash' 'electron22' 'glibc' 'gcc-libs' 'lib32-gcc-libs' 'python' 'lib32-glibc' 'java-runtime')
source=("git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '57e5b6ed9323799288fcdb386399d932cfe314b00a0eb8b8ece4f1e1d995387b')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
#build() {
#    cd "${srcdir}/${pkgname%-git}"
#    npm install
#    npm run prepare-build
#    sed "60s|snap|tar.gz|g" -i electron-builder.json
#    sed '57,59d' -i electron-builder.json
#    sed '16,19d' -i build/bin/build-linux-1.js
#    npx node build/bin/build-linux-1.js
#}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}/dist/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/work/app/assets/images/${pkgname%-git}.svg" \
        -t "${pkgdir}/usr/share/hicolor/scalables/apps"
    gendesk -f -n --categories "System;Utility" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
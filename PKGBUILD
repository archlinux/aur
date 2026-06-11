# Maintainer: petrouil
pkgname=pastemax
pkgver=1.1.1
pkgrel=1
pkgdesc='A simple tool to select files from a repository to copy/paste into an LLM'
arch=('x86_64')
url='https://github.com/kleneway/pastemax'
license=('MIT')
depends=('alsa-lib' 'gtk3' 'libxss' 'nss' 'libnotify' 'xdg-utils')
makedepends=('dpkg')
options=('!strip')
source=("${pkgname}_${pkgver}-stable_amd64.deb::https://github.com/kleneway/pastemax/releases/download/v${pkgver}-stable/${pkgname}_${pkgver}-stable_amd64.deb")
sha256sums=('a85a694a903733ccbd5f591b27994eaf9573603c341a827929e96333d8911c5e')

prepare() {
    dpkg-deb -x "${pkgname}_${pkgver}-stable_amd64.deb" "${srcdir}/deb"
}

package() {
    cp -r "${srcdir}/deb/opt/"* "${pkgdir}/opt/"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/PasteMax/pastemax" "${pkgdir}/usr/bin/pastemax"

    install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    if [[ -f "${pkgdir}/opt/PasteMax/resources/app/assets/icon.png" ]]; then
        cp "${pkgdir}/opt/PasteMax/resources/app/assets/icon.png" \
           "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    fi

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License

Copyright (c) kleneway

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}

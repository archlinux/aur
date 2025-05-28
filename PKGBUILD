# Maintainer: DasCanard <mail@richy.sh>
pkgname=radioss
pkgver=0.5.1
pkgrel=1
pkgdesc="A modern, cross-platform internet radio player built with Tauri, React, and TypeScript"
arch=('x86_64')
url="https://github.com/DasCanard/radioss"
license=('MIT')
depends=('webkit2gtk' 'openssl')
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/DasCanard/radioss/releases/download/v0.5.1/radioss_0.5.1_amd64.deb")
sha256sums_x86_64=('66897acf2d0382a5b38b0cb19c204bfa04655966830829ec8b5ddd1916efc828')

package() {
    # Extract DEB package
    cd "${srcdir}"
    ar x "${pkgname}-${pkgver}.deb"
    tar xf data.tar.*
    
    # Install binary
    install -Dm755 "usr/bin/radioss" "${pkgdir}/usr/bin/radioss"
    
    # Install desktop entry if it exists
    if [ -f "usr/share/applications/radioss.desktop" ]; then
        install -Dm644 "usr/share/applications/radioss.desktop" "${pkgdir}/usr/share/applications/radioss.desktop"
    else
        # Create desktop entry
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/radioss.desktop" << EOD
[Desktop Entry]
Name=Radioss
Comment=A modern internet radio player
Exec=radioss
Icon=radioss
Type=Application
Categories=AudioVideo;Audio;Player;
StartupNotify=true
EOD
    fi
    
    # Install icon if it exists
    if [ -f "usr/share/icons/hicolor/256x256/apps/radioss.png" ]; then
        install -Dm644 "usr/share/icons/hicolor/256x256/apps/radioss.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/radioss.png"
    fi
    
    # Install license
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << EOL
MIT License

Copyright (c) 2024 richy

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
EOL
}

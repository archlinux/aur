# Maintainer: SKBotNL <skbotnl@mailfence.com>

pkgname="ungoogled-chromium-linchrome"
pkgver=98.0.4758.80_r950365
pkgrel=1
pkgdesc="Ungoogled Chromium, A lightweight approach to removing Google web service dependency (binary version from macchrome/linchrome)"
arch=("x86_64")
url="https://github.com/Eloston/ungoogled-chromium"
license=("BSD")
depends=("alsa-lib" "dbus" "desktop-file-utils" "ffmpeg" "flac" "fontconfig" "freetype2" "gtk3" "harfbuzz" "hicolor-icon-theme" "icu" "libcups" "libgcrypt" "libjpeg-turbo" "libpng" "libpulse" "libva" "libwebp" "libxml2" "libxslt" "libxss" "minizip" "nss" "opus" "pciutils" "re2" "snappy" "systemd" "ttf-liberation" "xdg-utils")
optdepends=("kdialog: support for native dialogs in Plasma" "kwallet: support for storing passwords in KWallet on Plasma" "gnome-keyring: password storage backend on GNOME / Xfce" "pipewire: WebRTC desktop sharing under Wayland")
provides=("chromium")
conflicts=("chromium")
source=(https://github.com/macchrome/linchrome/releases/download/v${pkgver//_/-}-portable-ungoogled-Lin64/ungoogled-chromium_${pkgver%_*}_1.vaapi_linux.tar.xz)
sha256sums=("4562df5e6870cd6ce1a00a3d9c57bc79fb4ac5b7a30088da4521f4a92993432c")

package() {
    mkdir -p  $pkgdir/usr/bin
    mkdir -p  $pkgdir/usr/lib/chromium
    mkdir -p  $pkgdir/usr/share/applications
    mkdir -p  $pkgdir/usr/share/licenses/chromium
    echo -e "[Desktop Entry]\nVersion=$pkgver
Name=Chromium\nGenericName=Web Browser\nExec=/usr/bin/chrome %U\nIcon=/usr/lib/chromium/product_logo_48.png\nType=Application\nCategories=Network;\nActions=new-window;new-private-window;\n\n[Desktop Action new-window]\nName=New Window\nExec=/usr/bin/chrome\n\n[Desktop Action new-private-window]\nName=New Incognito Window\nExec=/usr/bin/chrome --incognito" > chromium.desktop
    
    echo -e "\nBSD 3-Clause License\n\nCopyright (c) 2015-2020, The ungoogled-chromium Authors\nAll rights reserved.\n\nRedistribution and use in source and binary forms, with or without\nmodification, are permitted provided that the following conditions are met:\n\n1. Redistributions of source code must retain the above copyright notice, this\n   list of conditions and the following disclaimer.\n\n2. Redistributions in binary form must reproduce the above copyright notice,\n   this list of conditions and the following disclaimer in the documentation\n   and/or other materials provided with the distribution.\n\n3. Neither the name of the copyright holder nor the names of its\n   contributors may be used to endorse or promote products derived from\n   this software without specific prior written permission.\n\nTHIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\"\nAND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE\nIMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE\nDISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE\nFOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL\nDAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR\nSERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER\nCAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,\nOR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE\nOF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE." > LICENSE
    
    cp chromium.desktop $pkgdir/usr/share/applications/chromium.desktop
    cp LICENSE $pkgdir/usr/share/licenses/chromium/chromium.desktop
    cp ungoogled-chromium_${pkgver%_*}_1.vaapi_linux/* $pkgdir/usr/lib/chromium -r
    ln -s /usr/lib/chromium/chromedriver $pkgdir/usr/bin/chromedriver
    ln -s /usr/lib/chromium/chrome $pkgdir/usr/bin/chrome
    
}

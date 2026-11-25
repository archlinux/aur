# Maintainer: Bernardo Pinto Gomes <bernardopgomes@hotmail.com>
# Binary package: repackages the release's portable Linux build (built on
# Debian 13 and verified on Arch Linux by the release workflow).
pkgname=bitter-browser-bin
_pkgname=bitter-browser
pkgver=0.6.2
pkgrel=1
pkgdesc='Focused, native web browser for the Linux desktop (prebuilt binary)'
arch=('x86_64')
url='https://browser.bebitterbebetter.com.br/'
license=('MPL-2.0')
depends=('dconf' 'glib2' 'glibc' 'gtk4' 'hicolor-icon-theme' 'libadwaita' 'libgcc' 'libsoup3' 'pango' 'webkitgtk-6.0')
optdepends=('gst-plugins-good: VP9, WebM and Opus video, as used by YouTube'
            'gst-plugins-bad: Media Source Extensions demuxers and AV1 decoding'
            'gst-libav: H.264 and AAC video'
            'gst-plugin-va: hardware video decoding on Intel and AMD graphics'
            'xdg-desktop-portal: camera, microphone and screen sharing'
            'xdg-utils: make Bitter Browser the default browser on every desktop'
            'geoclue: location for sites you allow'
            'hunspell-en_us: spell checking dictionary (install the ones for your languages)')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" 'bitter-browser-git')
options=('!strip' '!debug')
source_x86_64=("https://github.com/bernardopg/bitter-browser/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.xz")
sha256sums_x86_64=('944b3ae1d402081575060a1ba9e39afeb5712a047ba0aa655f43586c1a15d4ef')

package() {
    cd "$_pkgname-$pkgver-linux-$CARCH"
    install -Dm755 -t "$pkgdir/usr/bin" bin/bitter-ui bin/bitter-cli
    cp -a share "$pkgdir/usr/"
    find "$pkgdir/usr/share" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share" -type f -exec chmod 644 {} +
}

# Maintainer: Lucas Gabriel <g at 11xx dot org>
pkgname=muzaiten-bin
# Date-based, matching the release artifact (YYYY.MM.DD.N.g<sha>).
# Bump this, _release_tag, and sha256sums for every published release.
pkgver=2026.07.12.4.g055e2aa
_release_tag=2026.07.12
pkgrel=1
pkgdesc="Native music player for local libraries, with ratings and scrobbling (prebuilt, bundled Last.fm credentials)"
arch=('x86_64')
url="https://codeberg.org/11xx/muzaiten"
license=('Unlicense')
depends=('qt6-base' 'qt6-multimedia' 'taglib' 'chromaprint' 'gstreamer' 'gst-plugins-base-libs' 'glib2' 'zstd' 'python')
optdepends=('gst-plugins-good: extra audio decoders and sinks'
            'gst-plugin-pipewire: PipeWire audio output'
            'gst-plugins-bad: additional codecs and native DSF DSD playback'
            'gst-libav: DSD demux and DSD-to-PCM decode'
            'mpd: browse an MPD library alongside local sources'
            'yt-dlp: enrich YouTube playlist imports with metadata'
            'muzaiten-features-clap: optional semantic audio analysis and search provider')
provides=('muzaiten')
conflicts=('muzaiten' 'muzaiten-git')
options=('!strip')  # build-release.sh already strips the native executables
source=("muzaiten-${pkgver}-${CARCH}.tar.zst::https://codeberg.org/11xx/muzaiten/releases/download/${_release_tag}/muzaiten-${pkgver}-${CARCH}.tar.zst")
sha256sums=('e61e79d93f61f9151cea4ed7c1bb9565f7497bfd8889620b186ffaddf33f3018')

package() {
    # The tarball is a prefixed tree (usr/bin, usr/share/...) staged by
    # packaging/build-release.sh.
    tar -C "$pkgdir" -xf "muzaiten-${pkgver}-${CARCH}.tar.zst"
    # Re-home the license directory under this package's name.
    if [[ -d "$pkgdir/usr/share/licenses/muzaiten" ]]; then
        mv "$pkgdir/usr/share/licenses/muzaiten" "$pkgdir/usr/share/licenses/$pkgname"
    fi
}

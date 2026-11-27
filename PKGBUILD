# Maintainer: novesce <120620395+novesce@users.noreply.github.com>
pkgname=avernella-bin
pkgver=0.1+git74.acd0d3b
pkgrel=1
pkgdesc='Native Linux client for LINE, packaged from the Avernella Ubuntu release'
arch=('x86_64')
url='https://github.com/novesce/avernella'
license=('GPL-3.0-or-later')
depends=('glibc' 'sdl2-compat' 'cairo' 'pango' 'glib2' 'qrencode' 'curl'
         'libcrypto.so=3-64' 'libvpx.so=12-64' 'libjpeg-turbo' 'libpng' 'libwebp' 'opus'
         'libsrtp' 'libpipewire' 'zlib' 'gtk4' 'webkitgtk-6.0')
optdepends=('ffmpeg: video playback and recording'
            'vulkan-icd-loader: native GPU rendering with a Vulkan driver'
            'xdg-desktop-portal: screenshots and screen sharing'
            'zbar: scanning QR images')
provides=("avernella=$pkgver")
conflicts=('avernella')
_deb='avernella_0.1+git74.acd0d3b_amd64.deb'
source=("https://github.com/novesce/avernella-packaging/releases/download/avernella-acd0d3ba45bbcc3026f38388cbf5c4a319915673/$_deb")
sha256sums=('627afa59cfd14a4404c5de26b1706af3aec51c73c9560c7102934e5f938776df')
noextract=("$_deb")
options=('!strip' '!debug')

package() {
    bsdtar -xOf "$srcdir/$_deb" data.tar.xz | bsdtar --no-same-owner -xf - -C "$pkgdir"
    install -Dm644 "$pkgdir/usr/share/doc/avernella/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

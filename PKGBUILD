# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
_pkgname='chatterino2-7tv'
pkgname="${_pkgname}-bin"
pkgver=2.5.6
pkgrel=1
scdir=$_pkgname
_pkgver="${pkgver//_/-}"
_gitname="release-${_pkgver}"
pkgdesc="A fork of Chatterino2 with built-in support for 7tv emotes"
arch=('x86_64')
url="https://github.com/SevenTV/chatterino7"
license=('MIT')
depends=('icu' 'libxkbcommon' 'libxkbcommon-x11' 'xcb-util-image' 'xcb-util-wm' 'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-renderutil' 'libnotify')
makedepends=('binutils' 'patchelf')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output'
            'gst-plugins-good: For audio output')
provides=(chatterino)
conflicts=(chatterino)
source_x86_64=("${_pkgname}-${pkgver}_x64.deb::https://github.com/Seventv/chatterino7/releases/download/v$pkgver/Chatterino-Ubuntu-26.04-x86_64.deb")

package() {
	tar xf data.tar.zst -C "${pkgdir}"
	install -d "${pkgdir}/opt/${_pkgname}"
        install -dm755 "$pkgdir/usr/bin"
        nm -D "$pkgdir/usr/bin/chatterino"|grep _70|awk '{print $2 " " $2 | "sed s/70$/76/"}' > map.txt
        patchelf "$pkgdir/usr/bin/chatterino" --rename-dynamic-symbols map.txt --replace-needed libicuuc.so{.70,} --replace-needed libicui18n.so{.70,}
}
sha256sums_x86_64=('4d1b03a69aa2ba059ebf213d78b7ef7ea003f074e57ba6f8bc49ce0d36ab142d')

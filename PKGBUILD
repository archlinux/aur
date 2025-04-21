# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
_pkgname='chatterino2'
pkgname="${_pkgname}-bin"
provides=chatterino
conflicts=chatterino
pkgver=2.5.3
pkgrel=2
scdir=$_pkgname
_pkgver="${pkgver//_/-}"
_gitname="release-${_pkgver}"
pkgdesc="Second installment of the Twitch chat client series "Chatterino""
arch=('x86_64')
url="https://github.com/chatterino/chatterino2"
license=('MIT')
depends=('icu' 'libxkbcommon' 'libxkbcommon-x11' 'xcb-util-image' 'xcb-util-wm' 'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-renderutil' 'libnotify')
makedepends=('binutils' 'patchelf')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output'
            'gst-plugins-good: For audio output')
provides=(chatterino)
conflicts=(chatterino)
#source=(${_pkgname}.desktop)
source_x86_64=("${_pkgname}-${pkgver}_x64.deb::https://github.com/Chatterino/chatterino2/releases/download/v$pkgver/Chatterino-Ubuntu-24.04.deb")
package() {
	tar xf data.tar.zst -C "${pkgdir}"
	install -d "${pkgdir}/opt/${_pkgname}"
    	install -dm755 "$pkgdir/usr/bin"
        nm -D "$pkgdir/usr/bin/chatterino"|grep _70|awk '{print $2 " " $2 | "sed s/70$/76/"}' > map.txt
        patchelf "$pkgdir/usr/bin/chatterino" --rename-dynamic-symbols map.txt --replace-needed libicuuc.so{.70,} --replace-needed libicui18n.so{.70,}
}
sha256sums_x86_64=('8a68cf764716a7c68941c6288335a81888d2bd9df44fa4d1d866cc0ca681aba7')

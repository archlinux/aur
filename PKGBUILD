## Maintainer: Speykious <speykious@gmail.com>

pkgname=figma-linux-bin
_pkgver=`cat current_version`
_appimage="figma-linux_${_pkgver}_linux_x86_64.AppImage"
pkgver=`echo "$_pkgver" | tr '\\:/\- ' '_'`
pkgrel=1
pkgdesc="The collaborative interface design tool. Unofficial Figma desktop client for Linux (AppImage)"
arch=(x86_64 aarch64)
url="https://github.com/Figma-linux/figma-linux"
license=(GPL2)
depends=(fuse2 zlib hicolor-icon-theme)
makedepends=(xdg-utils)
provides=(figma-linux)
conflicts=(figma-linux)
options=(!strip)
source=(figma-linux.desktop
        24x24.png
        36x36.png
        48x48.png
        64x64.png
        72x72.png
        96x96.png
        128x128.png
        192x192.png
        256x256.png
        384x384.png
        512x512.png
        "https://github.com/Figma-linux/figma-linux/releases/download/v$_pkgver/$_appimage")
sha256sums=('dd02374b347f627d5d0a2201d366e5fd76eb1958759d311b3d72826a4a22fd47'
            'c94eaaf01a82688ab7951ea1d1085f50c3ebed588993d68c173139db848b21c6'
            '40b456b40c557395b1d9cedd035c7d14a169f8207d60441177e1f3c0582768da'
            '72d0c9df5b81a7666a05751a38fe096f629096be73792355f6069024cf7c0412'
            '780219a3792c5c4160829e7a8023e16f78e12c807762d7217a9db90e43a3f777'
            'c00c6751c90b394fc7bca51e5c6f139f16843d5f9f425b4ba31627dbaffaf0f9'
            '8d8f214d2e1f8e3816bbcf1262b273bedd56f1504326a2d54b2a1ba6cede63de'
            '86f34a8d9ddfdcfad5cc5e170a729cee7bca61102fbe0b10746b7f83b19d45bc'
            'f31ecf744bcf883a10656568aa3e3d5e9efa5c705d54803a3e58fe768d30006a'
            '1db635df7d84f73694303eba423acd75da892e084cf35c4e260bd5c6b56fcc1e'
            '5dc381da3bb02e5bc9d60cdbae3e3c5c8f249a83b4ef606721bb87559d0a122b'
            'e77bf9e7c699a53e69ba4a025e31ccf2b0a3b4c86acc842f7d0ecf1f8fe71ac2'
            '59c4f54e925f17253ad8852f48bb936c9f08c9964591682333dd6c91395848e1')

package() {
    install -Dm644 "$srcdir/figma-linux.desktop" "$pkgdir/usr/share/applications/figma-linux.desktop"
    install -Dm644 "$srcdir/256x256.png" "$pkgdir/usr/share/pixmaps/figma-linux.png"

    for size in 24 36 48 64 72 96 128 192 256 384 512; do
        install -Dm644 "$srcdir/${size}x${size}.png" \
               "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/figma-linux.png"
    done

	# Install binary
	install -Dm755 "$_appimage" "$pkgdir/usr/bin/figma-linux"

    # This is required for browser login to work
    xdg-mime default figma-linux.desktop x-scheme-handler/figma
}

# Maintainer: ardahzr
# The AUR package of the game, built from the Linux release zip. tools/aur/publish.sh fills in the
# version and checksum and pushes it to the AUR; see docs/BUILD.md.

pkgname=boo-be-afraid
pkgver=0.8
pkgrel=1
pkgdesc="Co-op monster game: scare the visitors out of the house before dawn"
arch=('x86_64')
url="https://github.com/ardahzr/boo-be-afraid-releases"
license=('LicenseRef-BooBeAfraid')
# Godot loads these at run time: Vulkan (OpenGL as fallback), X11 or Wayland, ALSA or PulseAudio.
depends=('glibc' 'libx11' 'libxcursor' 'libxext' 'libxi' 'libxinerama' 'libxrandr' 'libxrender'
         'libxkbcommon' 'wayland' 'libglvnd' 'vulkan-icd-loader' 'alsa-lib' 'libpulse' 'fontconfig'
         'hicolor-icon-theme')
optdepends=('steam: online lobbies and invites (play over the local network without it)'
            'libdecor: window decorations on Wayland'
            'speech-dispatcher: text to speech')
# The game's data is packed inside the binary; stripping it would cut the data off.
options=('!strip' '!debug')
source=("BooBeAfraid-${pkgver}-linux.zip::${url}/releases/download/v${pkgver}/BooBeAfraid-${pkgver}-linux.zip"
        'boo-be-afraid.sh'
        'boo-be-afraid.desktop'
        'boo-be-afraid.svg'
        'LICENSE')
sha256sums=('16f2c6232d07b7562b0411988faeda7067735a88f90ce6b0c7acd613e6fac155'
            '07498a1c0d453a0f4017e90b9bd329e851ad70c0b0ca4bf72ca520398c03e6bb'
            'b5127793655cee7cd9c7cf44d692bd6910a5097822fe3175443330257dced077'
            'ba279a0240e32bd5bde690c1cd7f8e472448e208d4521329476a8eeb04450642'
            'c30020215a5bb16ac12b710e74afc35724f01bb3bf47d6760eaee513dfd67541')

package() {
  install -d "$pkgdir/opt/$pkgname"
  install -Dm755 linux/BooBeAfraid.x86_64 "$pkgdir/opt/$pkgname/BooBeAfraid.x86_64"
  install -Dm755 linux/libgodotsteam.linux.template_release.x86_64.so \
    "$pkgdir/opt/$pkgname/libgodotsteam.linux.template_release.x86_64.so"
  install -Dm755 linux/libsteam_api.so "$pkgdir/opt/$pkgname/libsteam_api.so"
  install -Dm644 linux/README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
  install -Dm755 boo-be-afraid.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 boo-be-afraid.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 boo-be-afraid.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

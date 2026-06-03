# Maintainer: TheMrAhmad <https://github.com/AtomicError>
pkgname=whisper-desktop-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A gorgeous, premium Rust & Tauri GUI to manage and execute whisper.cpp transcriber tasks (precompiled binary version)"
arch=('x86_64')
url="https://github.com/AtomicError/whisper-desktop"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'ffmpeg')
provides=('whisper-desktop')
conflicts=('whisper-desktop')
options=('!strip' '!zipman')

source_x86_64=("https://github.com/AtomicError/whisper-desktop/releases/download/v${pkgver}/Whisper.Desktop_${pkgver}_amd64.deb")
sha256sums_x86_64=('2c1f8eb702056c60e8ddda1201bc01dcdeee82e571fc30efc471c2bdf77107d8')

package() {
  cd "$srcdir"
  
  # Extract the main data payload of the deb package into the Arch packaging directory
  if [ -f data.tar.zst ]; then
    tar -xf data.tar.zst -C "$pkgdir/"
  elif [ -f data.tar.xz ]; then
    tar -xf data.tar.xz -C "$pkgdir/"
  else
    # Safe fallback if makepkg didn't automatically unpack the deb archive
    bsdtar -xf "Whisper.Desktop_${pkgver}_amd64.deb"
    tar -xf data.tar.* -C "$pkgdir/"
  fi
}

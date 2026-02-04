# Maintainer: sekret
_name="MT-PowerDrumKit"
pkgname=mtpdk
pkgver=2.1.4.0
pkgrel=1
pkgdesc="The MT Power Drum Kit is a free drum sampler offering the powerful, high-quality sounds of an acoustic, realistic drum kit"
arch=(x86_64)
url="https://www.powerdrumkit.com"
license=('custom')
groups=('pro-audio' 'vst3-plugins')
depends=('libxkbcommon' 'xcb-util-cursor' 'glib2' 'xcb-util' 'gcc-libs' 'fontconfig' 'libx11' 'libxkbcommon-x11' 'libxcb' 'cairo' 'glibc' 'pango')
options=(!debug)
source=("https://resources.manda-audio.com/DOWNLOADS/products/mtpdk2_free/${pkgver%.*}/MTPDK-$pkgver-VST3-64bit-Linux-FULL.zip")
sha256sums=('eefb87a8776bd8436abb15559005c46011f1a273575ad0650570677cc6538dfa')

package() {
 install -Dm755 "$_name.vst3/Contents/$CARCH-linux/$_name.so" "$pkgdir/usr/lib/vst3/$_name.vst3/Contents/$CARCH-linux/$_name.so"
 install -Dm644 "License Agreement.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 cd "$_name.vst3/Contents/Resources/"
 for i in *
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/vst3/$_name.vst3/Contents/Resources/$i"
 done
 rm "$pkgdir/usr/lib/vst3/$_name.vst3/Contents/Resources/Thumbs.db"
}

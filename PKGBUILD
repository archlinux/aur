# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: usrmusicman

pkgbase=socalabs-wavetable
pkgname=($pkgbase-lv2-bin $pkgbase-vst-bin $pkgbase-vst3-bin)
pkgver=1.0.23
pkgrel=1
arch=(x86_64)
url='https://socalabs.com/synths/wavetable/'
license=(BSD-3-Clause)
groups=(pro-audio)
depends=(freetype2 glibc gcc-libs)
makedepends=(xdg-user-dirs unzip)
source=("LICENSE-socalabs-wavetable::https://raw.githubusercontent.com/FigBug/Wavetable/$pkgver/LICENSE")
source_x86_64=("$pkgbase-$pkgver.zip::https://socalabs.com/files/get.php?id=Wavetable_Linux.zip")
sha256sums=('65723088b243ad18fdd0417c911deac03593ded0b7a089b0d100a988528c8af3')
sha256sums_x86_64=('47a48dcc02aa5216a009ce823541635e30afa1f2365b9e96315a64f0895df0de')

package_socalabs-wavetable-lv2-bin() {
  depends+=(libasound.so libcurl.so libfreetype.so)
  pkgdesc="Socalabs Retro Wavetable Synth (LV2)"
  groups+=(lv2-plugins)
  optdepends=('lv2-host: for loading the LV2 plugin')
  install -v -Dm644 "$srcdir"/Wavetable.lv2/*.ttl -t "$pkgdir"/usr/lib/lv2/Wavetable.lv2
  install -v -Dm755 "$srcdir"/Wavetable.lv2/*.so -t "$pkgdir"/usr/lib/lv2/Wavetable.lv2
  install -v -Dm 644 "$srcdir"/LICENSE-socalabs-wavetable \
    -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_socalabs-wavetable-vst-bin() {
  depends+=(libasound.so libcurl.so libfreetype.so)
  pkgdesc="Socalabs Retro Wavetable Synth (VST)"
  groups+=(vst-plugins)
  optdepends=('vst-host: for loading the VST2 plugin')
  install -v -Dm755 "$srcdir"/Wavetable.so -t "$pkgdir"/usr/lib/vst
  install -v -Dm 644 "$srcdir"/LICENSE-socalabs-wavetable \
    -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_socalabs-wavetable-vst3-bin() {
  depends+=(libasound.so libcurl.so libfreetype.so)
  pkgdesc="Socalabs Retro Wavetable Synth (VST3)"
  groups+=(vst3-plugins)
  optdepends=('vst3-host: for loading the VST3 plugin')
  install -v -Dm644 "$srcdir"/Wavetable.vst3/Contents/Resources/moduleinfo.json \
    -t "$pkgdir"/usr/lib/vst3/Wavetable.vst3/Contents/Resources
  install -v -Dm755 "$srcdir"/Wavetable.vst3/Contents/x86_64-linux/Wavetable.so \
    -t "$pkgdir"/usr/lib/vst3/Wavetable.vst3/Contents/x86_64-linux/
  install -v -Dm 644 "$srcdir"/LICENSE-socalabs-wavetable \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

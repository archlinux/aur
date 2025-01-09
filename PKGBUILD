# Maintainer: Utku Helvacı <utku.helvaci.tux@gmail.com>
pkgname="midis2jam2-bin"
pkgver="1.9.0"
pkgrel="1"
pkgdesc="🎶 A remaster of MIDIJam, a 3D MIDI file visualizer."
arch=("aarch64" "x86_64")
license=('GPL3')
url="https://github.com/wyskoj/midis2jam2"
depends=('java-environment-common')
conflicts=("midis2jam2")
provides=("midis2jam2")

case "$CARCH" in
	arm64) _pkgarch="linuxArm64"
		;;
	x86_64) _pkgarch="linuxX64"
		;;
esac

source=('https://github.com/wyskoj/midis2jam2/raw/refs/heads/master/.idea/icon.svg'
        'midis2jam2-pre'
        'midis2jam2.desktop')
source_x86_64=("https://github.com/wyskoj/midis2jam2/releases/download/v1.9.0/midis2jam2-$_pkgarch-$pkgver.jar")
source_aarch64=("https://github.com/wyskoj/midis2jam2/releases/download/v1.9.0/midis2jam2-$_pkgarch-$pkgver.jar")
#comment out the line above and undo the line below when running makepkg -g and makepkg --printsrcinfo on x86_64 platform
#source_aarch64=("https://github.com/wyskoj/midis2jam2/releases/download/v1.9.0/midis2jam2-linuxArm64-$pkgver.jar")

sha512sums=('b2d82ffe943cae60cffa9f89a200f6f33b02e036f564751ce93e51e239e51dbe11279d7b7ac2677875baf76729968328f429b3a67a745e356b2665e46a3818de'
            '77615a9bd4b61c64c0162375be12241b8b69912bcfc6e6af0a6afb95a29cd5b7d07e06c1f889252bdfaa950c09a4471e6705e5a6c6712a030f7c5fa3ee2167ea'
            'd362c90ff8d1a3f5dec103b00ef2c81b9eece514f1b7aed3afcf5471f38406ea2d08fc6383d11b59f7ca89812a28452dd2a8e4086b3ca704de537215e6d0c6a7')
sha512sums_aarch64=('4ac2ad0ab3b902c857f56179a2dde51c31b06719a69d32a2621242cfd6de025d69e4c10d210f19a112a1d901ba1f71718cf1f8886e8911485bc38b4af93ca577')
sha512sums_x86_64=('409d2bf606e7e7922a2ea1e09e4b75779dbd8378ffa6b6a97ce81e458aed2b6fd907abef65c5b9c5bcc3a8abc29626adabf5bfdb3935539b0fa04e5632ca8999')

prepare() {
  cp -L -rf "$srcdir"/midis2jam2-pre "$srcdir"/midis2jam2
  echo 'java -jar /usr/lib/midis2jam2-'"$_pkgarch"'-'"$pkgver"'.jar' >> "$srcdir"/midis2jam2
}

package() {
  install -Dm755 "$srcdir"/icon.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/midis2jam2.svg
  install -Dm755 "$srcdir"/midis2jam2.desktop "$pkgdir"/usr/share/applications/midis2jam2.desktop
  install -Dm755 "$srcdir"/midis2jam2-"$_pkgarch"-"$pkgver".jar "$pkgdir"/usr/lib/midis2jam2-"$_pkgarch"-"$pkgver".jar
  install -Dm755 "$srcdir"/midis2jam2 "$pkgdir"/usr/bin/midis2jam2
    }

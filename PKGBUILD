# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pear-desktop-bin
pkgver=3.11.0
pkgrel=2
pkgdesc="Extension for music player"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/pear-devs/pear-desktop"
license=('MIT')
depends=(
  'gtk3'
  'libsecret'
  'nss'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'youtube-music')
install='youtube-music.install'
source=( "license-$pkgver::https://github.com/pear-devs/pear-desktop/raw/v$pkgver/license"
        'youtube-music.sh')
source_x86_64=("https://github.com/pear-devs/pear-desktop/releases/download/v$pkgver/youtube-music_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/pear-devs/pear-desktop/releases/download/v$pkgver/youtube-music_${pkgver}_arm64.deb")
source_armv7h=("https://github.com/pear-devs/pear-desktop/releases/download/v$pkgver/youtube-music_${pkgver}_armv7l.deb")
sha256sums=('e7e14b3b771ecadb23f6ee0b6f99d1553e385e35cdb44fc8e36ee7c878dacd08'
            '3769e2d994ad011e8481f3ed448557cd9e5b5f1a805d84b4944639c807440d8c')
sha256sums_x86_64=('db20c40bdcc558aaa85d6d5c20a3ec1e32795fcd6ffaa7e4f99757004736face')
sha256sums_aarch64=('49ac8f0782fd0bf1209a18762bfba9efe8128e92869598042abcd5e15d76a825')
sha256sums_armv7h=('29afb031623c7154826d22cab30428cf69f77ab8d8588988d4eb0fc09b6c7cdf')

package(){
  bsdtar xfv data.tar.xz -C "$pkgdir"

  desktop-file-edit --set-key=Exec --set-value="youtube-music %U" \
    "$pkgdir/usr/share/applications/youtube-music.desktop"

  install -Dm755 youtube-music.sh "$pkgdir/usr/bin/youtube-music"

  install -Dm644 "license-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/license"
}

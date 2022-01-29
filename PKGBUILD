# Maintainer: Mathieu ATTAL <mathieu.attal@gmail.com>
# Contributor: Mathieu ATTAL <mathieu.attal@gmail.com>

# There is no source code available for the app itself.
# Repository https://github.com/TerryCavanagh/boscaceoil/

pkgname=boscaceoil

_pkgver_tag='2.0' # Git tag associated with the release where the latest archive is.
_pkgver_suffix='.0' # Anything after $_pkgver_tag that is present in the archive name.
_pkgver_upstream="$_pkgver_tag$_pkgver_suffix"

pkgver="$_pkgver_upstream"

pkgrel=1

pkgdesc='Bosca Ceoil is a free, easy to use tool for creating music!'
arch=('x86_64')
url="https://boscaceoil.net/"
source=("boscaceoil_win_v2.zip::http://www.boscaceoil.net/downloads/boscaceoil_win_v2.zip"
        'boscaceoil'
        'boscaceoil.desktop'
        'LICENSE')
license=('custom')
depends=(wine lib32-alsa-plugins lib32-libpulse lib32-openal)
makedepends=(icoutils)
sha512sums=('73fa4bd00b85920197221ba0fb1dfc5412c98d6a7a6eebe8e4c46289a2846edfaede0feadd5e7b020c09b716206ca641e33b465c9968c4cbb6eb998b93593cc2'
            '6004c38f7d95b084aaad6d66c59a0b9056dc500d8e11db315b6cf6b8fae6ea56e84c38ef59528961ca156d8d7a99de1a55c3c0f2b0f40752e5997c8dd141f11b'
            '504c4c050e86639d839d809b2b4d84fe4f4e4cee38bd1c2c1bea275902c8440cd1b0cb994090d9a72980887e14e006b95596260fffda03945de0acae16a91891'
            '06cf0662a4ac8bc8fe8b4cae13a244d03536239fec9839b5b67f64aeda8e3268e7d01d65acf401a45ba8415da31c6acc9c8d9bc725390f8ab640242a5253d5c8')

build() {
  wrestool -x --output=boscaceoil.ico -t14 "BoscaCeoil.exe"
  icotool -x boscaceoil.ico -o boscaceoil.png
}

package() {
  install -dm755 "$pkgdir/usr/share/boscaceoil"
  cp -ra "." "$pkgdir/usr/share/boscaceoil"
  rm -rf "$pkgdir/usr/share/boscaceoil/boscaceoil_win_v2.zip"

  install -Dm755 boscaceoil "$pkgdir/usr/bin/boscaceoil"

  install -dm755 "$pkgdir/usr/share/applications"
  install -m644 boscaceoil.desktop "$pkgdir/usr/share/applications/boscaceoil.desktop"

  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -m644 boscaceoil.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/boscaceoil.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

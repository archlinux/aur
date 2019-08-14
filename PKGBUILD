# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: kaptoxic <kaptoxic at yahoo dot com>
# Contributor: Matthew Avant <matthew dot avant at gmail dot com>
# Contributor: Rose Ames <rose at happyspork dot com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=zulip-desktop
pkgver=4.0.0
pkgrel=1
pkgdesc='Real-time team chat based on the email threading model'
arch=(i686 x86_64)
url=https://zulipchat.com
license=(Apache)
depends=(alsa-lib atk at-spi2-atk cairo dbus fontconfig gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libcups libxcomposite libxcursor libxdamage libxfixes libxi libxrandr libxrender libxss libxtst nspr nss pango)
makedepends=(npm python2 libxkbfile)
source=(https://github.com/zulip/$pkgname/archive/v$pkgver.tar.gz
        zulip.desktop)
sha512sums=('4cbdbc73d09ac50599cba460eccd0b72c901b68a00d4995b9bc16f0f980715155cafc1f14a5d1ab5a97672c5413679ce96f38212f7e0935df85b1c0f1e3465ec'
            '396b3a3df1ca9fa61d2283eca60c71549e0db76e82b49afdd16c5d1d01fc42c18185555cd5e247e1a039ee998c5a1fd6b73886a67a10bdbadb54132769a58fa5')

build() {
  cd $pkgname-$pkgver
  npm install
}

package() {
  install -Dm 644 zulip.desktop -t "$pkgdir"/usr/share/applications

  cd $pkgname-$pkgver

  install -dm 755 "$pkgdir"/usr/{lib,bin}
  cp -a dist/linux-unpacked "$pkgdir"/usr/lib/$pkgname
  ln -s /usr/lib/$pkgname/zulip "$pkgdir"/usr/bin

  for i in 16 24 32 48 64 96 128 256 512; do
    install -Dm 644 build/icons/${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/zulip.png
  done

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/zulip-desktop
}

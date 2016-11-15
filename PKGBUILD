# Maintainer: Nissar Chababy <funilrys at outlook dot com>
pkgname=kaku-bin
pkgver=1.8.0
pkgrel=2
pkgdesc="The next generation music client."
# TODO: add 32 bit
arch=('x86_64' 'i686')
url="http://kaku.rocks"
license=('MIT')
depends=('gconf' 'gtk2' 'fuse' 'xdg-utils' 'libxtst' 'libxss' 'nss' 'alsa-lib')
optdepends=('xdialog: .desktop file installation dialog'
            'zenity: .desktop file installation dialog'
            'kdebase-kdialog: .desktop file installation dialog'
            'libnotify: Desktop notifications')
conflicts=('kaku')
options=(!strip)
source=("https://raw.githubusercontent.com/EragonJ/Kaku/master/LICENSE")
source_x86_64=("https://github.com/EragonJ/Kaku/releases/download/$pkgver/Kaku-$pkgver-x86_64.AppImage")
source_i686=("https://github.com/EragonJ/Kaku/releases/download/$pkgver/Kaku-$pkgver-ia32.AppImage")
sha512sums=('354016d1de60b330e50f996dcdf61989091b44b28f096f7cb83f83c006cb2d51ef3da94a49d2ba73b71bc294a206a524d38a6b3c0f5bf1cc3ac6048d57624b04')
sha512sums_x86_64=('e94f5238306e47f06c4093454da41a36ecf69ed8b1bcee576b8cfa4a2ffeadf0e8be3aa1af528df63700d20567038570454bf91104d8428eb5fd81ae82715bb8')
sha512sums_i686=('1a4d5e122d379a5e59ed8eed1b0e249689d58a4453552ddbaa3296945999a2f529ba3dac1721189fb1437b8b109899239a3164e7ab02b4654750a2fdf8dfcfe9')

if [ $arch == "x86_64" ]
then
    noextract=("Kaku-$pkgver-x86_64.AppImage")
else
    noextract=("Kaku-$pkgver-ia32.AppImage")
fi

package() {
  install -d "$pkgdir"/{opt/kaku,usr/bin}
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  if [ $arch == "x86_64" ]
  then
      install -m755 Kaku-$pkgver-x86_64.AppImage "$pkgdir"/opt/kaku
      ln -s /opt/kaku/Kaku-$pkgver-x86_64.AppImage "$pkgdir"/usr/bin/kaku
  else
      install -m755 Kaku-$pkgver-ia32.AppImage "$pkgdir"/opt/kaku
      ln -s /opt/kaku/Kaku-$pkgver-ia32.AppImage "$pkgdir"/usr/bin/kaku
  fi

}

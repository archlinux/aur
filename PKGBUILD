# Maintainer: Nissar Chababy <funilrys at outlook dot com>
pkgname=kaku-bin
pkgver=1.8.5
pkgrel=2
pkgdesc="The next generation music client."

arch=('x86_64' 'i686')
url="http://kaku.rocks"
license=('MIT')
depends=('gconf' 'gtk2' 'fuse' 'xdg-utils' 'libxtst' 'libxss' 'nss' 'alsa-lib')
optdepends=('xdialog: .desktop file installation dialog'
            'zenity: .desktop file installation dialog'
            'kdialog: .desktop file installation dialog'
            'libnotify: Desktop notifications')
conflicts=('kaku')
options=(!strip)

source=("https://raw.githubusercontent.com/EragonJ/Kaku/master/LICENSE")
source_x86_64=("https://github.com/EragonJ/Kaku/releases/download/$pkgver/Kaku-$pkgver-$CARCH.AppImage")
source_i686=("https://github.com/EragonJ/Kaku/releases/download/$pkgver/Kaku-$pkgver-ia32.AppImage")

sha512sums=('354016d1de60b330e50f996dcdf61989091b44b28f096f7cb83f83c006cb2d51ef3da94a49d2ba73b71bc294a206a524d38a6b3c0f5bf1cc3ac6048d57624b04')
sha512sums_x86_64=('e9112dd111fcfc4d1edc9bc05f21ea3bca1f90d5759498e64a0fc453fd50fa7803f005c50f01e2b640474e497482068d8297cf020d11ce1293dc98dea80d9206')
sha512sums_i686=('d99a5f2751fd0552e04621eb40067eb90d721a29f7be1c4d037aaff51dafbaa277d92f0e23b9293585498f6f4697f03b8638f27081fd0a34c3472fa4383e5cf0')

if [ $CARCH == "x86_64" ]
then
    noextract=("Kaku-$pkgver-$CARCH.AppImage")
else
    noextract=("Kaku-$pkgver-ia32.AppImage")
fi

package() {
  install -d "$pkgdir"/{opt/kaku,usr/bin}
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  if [ $CARCH == "x86_64" ]
  then
      install -m755 Kaku-$pkgver-$CARCH.AppImage "$pkgdir"/opt/kaku
      ln -s /opt/kaku/Kaku-$pkgver-$CARCH.AppImage "$pkgdir"/usr/bin/kaku
  else
      install -m755 Kaku-$pkgver-ia32.AppImage "$pkgdir"/opt/kaku
      ln -s /opt/kaku/Kaku-$pkgver-ia32.AppImage "$pkgdir"/usr/bin/kaku
  fi

}

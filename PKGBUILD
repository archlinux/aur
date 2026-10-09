# Maintainer: raafat.turki <raafat.turki@protonmail.com>

pkgname=coredeck-bin
_name=CoreDeck
pkgver=0.13.2
pkgrel=1
pkgdesc='Native desktop command center for the Android SDK (AVDs, system images, APK inspection)'

arch=('x86_64' 'aarch64')
url='https://coredeck.dev'
license=('MIT')

depends=('curl' 'libglvnd' 'gcc-libs' 'glibc')
optdepends=('jdk-openjdk: JDK 17+ required by avdmanager and sdkmanager'
            'zenity: native file dialogs on GTK desktops'
            'kdialog: native file dialogs on KDE'
            'xdg-utils: open links and folders from the app')
provides=('coredeck')
conflicts=('coredeck')

options=('!strip' '!debug')
source=("$_name-$pkgver-LICENSE::https://raw.githubusercontent.com/devmuaz/$_name/v$pkgver/LICENSE"
        'coredeck.desktop')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/devmuaz/$_name/releases/download/v$pkgver/coredeck-linux-x86-64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/devmuaz/$_name/releases/download/v$pkgver/coredeck-linux-arm64.tar.gz")

sha256sums=('d38b5905e96871c4c21563212bdb13d856663b2b94a57efcf8068ff537919706'
            '7ea39a99bffcea8f965587c322381cd87544dec1e6e4991f03bb38b17eb7d3e9')
sha256sums_x86_64=('e269b93f9876dfb2b3c82d83cbf3942fa08debb0865c4ba76be1f53d27fd161f')
sha256sums_aarch64=('ff344058d61fbcee235cfa4ae8c212d3f85ffb7ba2519c928f4f5eb12ae5c688')

package() {
  case "$CARCH" in
    x86_64)  _dir=coredeck-linux-x86-64 ;;
    aarch64) _dir=coredeck-linux-arm64 ;;
  esac

  install -dm755 "$pkgdir/opt/coredeck"
  cp -r "$srcdir/$_dir/." "$pkgdir/opt/coredeck/"
  chmod 755 "$pkgdir/opt/coredeck/$_name"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/coredeck/$_name" "$pkgdir/usr/bin/coredeck"

  install -Dm644 "$srcdir/coredeck.desktop" "$pkgdir/usr/share/applications/coredeck.desktop"
  install -Dm644 "$srcdir/$_dir/assets/icons/icon.png" "$pkgdir/usr/share/pixmaps/coredeck.png"
  install -Dm644 "$srcdir/$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

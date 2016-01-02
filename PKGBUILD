# Maintainer: Ashwin Vishnu <ashuwish+arch at gmail dot com>

pkgname=sendanywhere
pkgver=1.12.18
pkgrel=1
pkgdesc="Send Anywhere, a peer-to-peer file sharing service"
arch=('i686' 'x86_64')
url="https://send-anywhere.com"
license=('custom:sendanywhere_eula')
provides=('sendanywhere')
depends=()
makedepends=('dpkg')
install=$pkgname.install

if [[ $CARCH = i686 ]];then
    sha256sums_i686=('ffdac92b5cce6e48af1c6cde2d2917ac6432089e7c327ccb2be1f7800609a974')
    source_i686=("https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_i386.deb")
else
    sha256sums_x86_64=('ad0168f85fbc2f3051a630dbd1621d5c48b2f2d32cfd76c961da391b57a10122')
    source_x86_64=("https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_amd64.deb")
fi

package() {
   echo '==> Extracting with dpkg.'
   dpkg -x "$srcdir/$_filename" "$pkgdir"

   echo '==> Copying license.'
   install -Dm644 "$pkgdir/usr/share/doc/sendanywhere/copyright"\
       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

   echo '==> Symlinking icons.'
   for size in 16 22 24 32 48 64 128 256;do
       install -dm755 "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps
       ln -s /opt/estmob/"$pkgname"/"$pkgname"_icon_${size}.png \
          "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/estmob-$pkgname.png
   done
}


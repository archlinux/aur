# Maintainer: Paragoumba <aur@paragoumba.fr>
# Contributor: Mario Ray MahardhikZza <leledumbo_cool@yahoo.co.id>
# Contributor: James Cuzella <james.cuzella@lyraphase.com>

_pkgname=vdhcoapp
pkgname="$_pkgname-bin"
pkgver=2.0.19
pkgrel=2
arch=('x86_64')
pkgdesc="Companion application for Video DownloadHelper browser add-on (binary version)"
url="https://github.com/aclap-dev/vdhcoapp"
license=('GPL-2.0-or-later')

options=('emptydirs' '!strip') # IMPORTANT! DO NOT REMOVE THIS, OTHERWISE THE BINARY WILL BE BROKEN!
install="$_pkgname.install"

provides=("vdhcoapp=$pkgver")
conflicts=('vdhcoapp')

source=("$_pkgname-$pkgver-linux-$arch.deb::https://github.com/aclap-dev/$_pkgname/releases/download/v${pkgver}/$_pkgname-linux-$arch.deb")

sha256sums=('496d341eef326f3fb6f0ddf825b309d6e18a4ddb7f1bec7fe74d9282ae94dfc4')

prepare() {
  mkdir -p "$srcdir/$pkgname"
}

package() {
  depends+=('ffmpeg')

  tar xf data.tar.xz -C "$pkgdir" "./opt/$_pkgname/filepicker" "./opt/$_pkgname/$_pkgname"

  ln -sf /usr/bin/ffmpeg "${pkgdir}/opt/$_pkgname/ffmpeg"
  ln -sf /usr/bin/ffprobe "${pkgdir}/opt/$_pkgname/ffprobe"

  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/opt/vdhcoapp/vdhcoapp" "${pkgdir}/usr/bin/vdhcoapp"

  install -dm755 "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/opt/chrome/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/chromium/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/opt/edge/native-messaging-hosts/"
}

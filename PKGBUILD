# Maintainer: Paragoumba <aur@paragoumba.fr>
# Contributor: Mario Ray MahardhikZza <leledumbo_cool@yahoo.co.id>
# Contributor: James Cuzella <james.cuzella@lyraphase.com>

_pkgname=vdhcoapp
pkgname="$_pkgname-bin"
pkgver=2.0.20
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

sha256sums=('312423d4ad54bf8bf391efa3669a4aafa7c98d9aaf1fe4af3d5b5014c28f4730')

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

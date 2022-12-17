# Maintainer: mickybart <mickybart at pygoscelis dot org>

pkgname=mkinitcpio-remotekey
pkgver=0.0.1
pkgrel=1
pkgdesc="Archlinux mkinitcpio hook to download a keyfile to unlock an encrypted root device in early userspace"
arch=('any')
url="https://github.com/mickybart/mkinitcpio-remotekey"
license=('GPLv3')
depends=('dropbear' 'openssh')
optdepends=('mkinitcpio-netconf: Network interface configuration')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::$url/releases/download/v$pkgver/v$pkgver.tar.gz.sig")
changelog='ChangeLog'
sha512sums=('6e33772fe95ed8d63e4e2846e849115d10ac28b8d2517499dfba799cf8fff35a1048ae9e85c3d2dfa5fb016f65dc1d2d7b202c6561bb208e216035a4c2bbc35e'
            'SKIP')
backup=('etc/dropbear/id_remotekey' 'etc/dropbear/remotekey')
validpgpkeys=('B026EDFDDDEBC59E3F60966AF9E8AF21879815B6')

package() {
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/initcpio/hooks/remotekey"     "$pkgdir/usr/lib/initcpio/hooks/remotekey"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/initcpio/install/remotekey"   "$pkgdir/usr/lib/initcpio/install/remotekey"
  install -Dm600 "$srcdir/${pkgname}-${pkgver}/initcpio/etc/dropbear/id_remotekey"  "$pkgdir/etc/dropbear/id_remotekey"
  install -Dm600 "$srcdir/${pkgname}-${pkgver}/initcpio/etc/dropbear/remotekey"     "$pkgdir/etc/dropbear/remotekey"

  install -Dm644 "$srcdir/${pkgname}-${pkgver}/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

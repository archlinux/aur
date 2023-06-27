# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=gopass-fuse
pkgver=1.1.2
pkgrel=1
pkgdesc="Virtual mount for gopass password manager"
license=('APACHE')
arch=('x86_64')
depends=('gopass' 'python-fusepy' 'python-dateutil')
source=("$pkgname" "$pkgname.service" "$pkgname.conf")
sha512sums=('43b89e85d7807926c43f98eec0f40d5c28cf0a71fb3f6b27cd86b66c06347eea374228c18f775c734e9b375af2b1bdd9e06a1121b19bfe8b3440620dfe276e4a'
            '7813e0272a2bda08b0ec477a3b7d1bf742c75ef0a83f0fe1a712ecc444c23121e6b3b42024d9076141af1c6ed9e57aa9a3bf11b66d3e5019e4116d7ff4ab0e98'
            '3dc50f27806bb67aa8c99a8d305c5ec7b83de2c6a5d506852492919518d86d06ffc996dfa9813019fe60da3e520a33f386486cd93215c7ae12d525d2bb9963d2')

package() {
  install -D -m 0755 -t $pkgdir/usr/bin/ $srcdir/$pkgname
  install -D -m 0644 -t $pkgdir/usr/lib/systemd/user/ $srcdir/$pkgname.service
  install -d $pkgdir/etc/systemd/user/basic.target.wants
  ln -s /usr/lib/systemd/user/gopass-fuse.service $pkgdir/etc/systemd/user/basic.target.wants/
  install -D -m 0644 -t $pkgdir/usr/share/user-tmpfiles.d/ $srcdir/$pkgname.conf
}

#vim: syntax=sh


# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=gopass-fuse
pkgver=1.2.0
pkgrel=1
pkgdesc="Virtual mount for gopass password manager"
license=('APACHE')
arch=('x86_64')
depends=('gopass' 'python-fusepy' 'python-dateutil')
source=("$pkgname" "$pkgname.service" "$pkgname.conf")
sha512sums=('43b89e85d7807926c43f98eec0f40d5c28cf0a71fb3f6b27cd86b66c06347eea374228c18f775c734e9b375af2b1bdd9e06a1121b19bfe8b3440620dfe276e4a'
            'b801a5fa04e037ceac96049d75e4890c527bf123fec7f7b8d31b48a407e181a3f75d3438776c46b03357f2305d5b65fb646f2e4327018c3d2004f1564f217e68'
            '3dc50f27806bb67aa8c99a8d305c5ec7b83de2c6a5d506852492919518d86d06ffc996dfa9813019fe60da3e520a33f386486cd93215c7ae12d525d2bb9963d2')

package() {
  local target=smartcard
  install -D -m 0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"
  install -D -m 0644 -t "$pkgdir/usr/lib/systemd/user/" "$srcdir/$pkgname.service"
  install -d "$pkgdir/etc/systemd/user/$target.target.wants"
  ln -s "/usr/lib/systemd/user/gopass-fuse.service" "$pkgdir/etc/systemd/user/$target.target.wants/"
  install -D -m 0644 -t "$pkgdir/usr/share/user-tmpfiles.d/" "$srcdir/$pkgname.conf"
}

#vim: syntax=sh

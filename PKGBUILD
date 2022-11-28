# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=gopass-fuse
pkgver=1.1.1
pkgrel=0
pkgdesc="Virtual mount for gopass password manager"
url="https://gitlab.teuto.net/technik/$pkgname"
license=('APACHE')
arch=('x86_64')
depends=('gopass' 'python-fusepy' 'python-dateutil')
source=("$pkgname" "$pkgname.service" "$pkgname.conf")
sha512sums=('62841857fa6825cdd8ef19693f25cd9cd2e502b00f13ff03d77464710d65086859c4e0474f2b83e00b0e65a2edb745c66ec99ed5eef1543f9b31cfcaa642020d'
            '7813e0272a2bda08b0ec477a3b7d1bf742c75ef0a83f0fe1a712ecc444c23121e6b3b42024d9076141af1c6ed9e57aa9a3bf11b66d3e5019e4116d7ff4ab0e98'
            '3dc50f27806bb67aa8c99a8d305c5ec7b83de2c6a5d506852492919518d86d06ffc996dfa9813019fe60da3e520a33f386486cd93215c7ae12d525d2bb9963d2')

package() {
  install -D -m 0755 -t $pkgdir/usr/bin/ $srcdir/$pkgname
  install -D -t $pkgdir/usr/lib/systemd/user/ $srcdir/$pkgname.service
  install -d $pkgdir/etc/systemd/user/basic.target.wants
  ln -s /usr/lib/systemd/user/gopass-fuse.service $pkgdir/etc/systemd/user/basic.target.wants/
  install -D -t $pkgdir/usr/share/user-tmpfiles.d/ $srcdir/$pkgname.conf
}

#vim: syntax=sh


# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=gopass-fuse
pkgver=1.1.0
pkgrel=0
pkgdesc="Virtual mount for gopass password manager"
url="https://gitlab.teuto.net/technik/$pkgname"
license=('APACHE')
arch=('x86_64')
depends=('gopass' 'python-fusepy' 'python-dateutil')
source=("$pkgname" "$pkgname.service" "99-$pkgname.rules" "$pkgname.conf")
sha512sums=('62841857fa6825cdd8ef19693f25cd9cd2e502b00f13ff03d77464710d65086859c4e0474f2b83e00b0e65a2edb745c66ec99ed5eef1543f9b31cfcaa642020d'
            '9d3c2c584ae00ecfe15f010a4cf74b40785aae1d42486dbbae4052f12d1929ab3a7e1601b236a47d6815c7e07ff30ead758058690e454560fc2f714e0172a822'
            '021d9900ab9fdc614f80dda62e5326b539820013200f16b909d802582cfe6e1c1d072da576b1d96a5eca0c9cd174f6c130e15c0d9fc73aa1fc26b165f7bc71b1'
            '3dc50f27806bb67aa8c99a8d305c5ec7b83de2c6a5d506852492919518d86d06ffc996dfa9813019fe60da3e520a33f386486cd93215c7ae12d525d2bb9963d2')

package() {
  install -D -m 0755 -t $pkgdir/usr/bin/ $srcdir/$pkgname
  install -D -m 0644 -t $pkgdir/usr/lib/systemd/user/ $srcdir/$pkgname.service
  install -d -m 0644 $pkgdir/etc/systemd/user/basic.target.wants
  ln -s /usr/lib/systemd/user/gopass-fuse.service $pkgdir/etc/systemd/user/basic.target.wants/
  install -D -m 0644 -t $pkgdir/etc/udev/rules.d/ $srcdir/99-$pkgname.rules
  install -D -m 0644 -t $pkgdir/usr/share/user-tmpfiles.d/ $srcdir/$pkgname.conf
}

#vim: syntax=sh


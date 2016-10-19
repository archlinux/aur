# Maintainer: Ivan Lisenkov <ivan@ivlis.com>
pkgname=mumax3
pkgver=3.9.3
pkgrel='2'
pkgdesc="GPU-accelerated micromagnetic simulation program"
arch=('x86_64')
url="http://mumax.github.io/"
license=('GPL')
depends=('cuda-7.5')
optdepends=('gnuplot: for fancy plots')
source=("https://github.com/mumax/3/releases/download/v$pkgver/mumax${pkgver}_linux_cuda7.5.tar.gz"
        "mumax_server::https://github.com/mumax/3/releases/download/v3.9.1/mumax3.9.1c_linux.tar.gz"
	mumax3-user.conf
	mumax3-dir.conf
	mumax3@.service)
md5sums=('fbac69c0bcf40309a7f0bf61d9745228'
         'f0891e4dcb6998d6cb2ac0650c721479'
	 'd788739ca6325bc2be1334515435f856'
	 '22d9c858cc5efcfd1296c2ea840e4153'
	 '344c65c943b930a5cd1907cb8f66d9ae')

install=mumax3.install

package() {
  mkdir -p ${pkgdir}/opt/mumax3/
  cp ${srcdir}/mumax3 ${pkgdir}/opt/mumax3 
  cp ${srcdir}/mumax3.9.1c_linux/mumax3-{server,convert} ${pkgdir}/opt/mumax3
  install -Dm644 "$srcdir/$pkgname-user.conf" "$pkgdir/usr/lib/sysusers.d/mumax3.conf"
  install -Dm644 "$srcdir/$pkgname-dir.conf" "$pkgdir/usr/lib/tmpfiles.d/mumax3.conf"
  install -Dm644 "$srcdir/mumax3@.service" "$pkgdir/usr/lib/systemd/system/mumax3@.service"
}

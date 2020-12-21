# Maintainer: Callum Vincent <kahlos@gmail.com>
pkgname=mumax3
pkgver=3.10
pkgrel='1'
pkgdesc="GPU-accelerated micromagnetic simulation program"
arch=('x86_64')
url="https://mumax.github.io/"
license=('GPL')
depends=('cuda>=11.0' 'nvidia>=450.36.06')
optdepends=('gnuplot: for plots in the web GUI')
source=("https://mumax.ugent.be/mumax3-binaries/mumax3.10_linux_cuda11.0.tar.gz"
	mumax3-user.conf
	mumax3-dir.conf
	mumax3@.service)
sha256sums=('4c03533986dbf2a9cd7f9708c2f32e4e1ca849bb300e7b0946fdf50daf0a2694'
	 'bde08909ca59497cfb05686e0ec1a43dc08f499a59861e96cac0d1412545321a'
	 '0ddad9502bc15cf7e6918c4c83cae8fa909f25b17120cbdf9fad8ba47ee18449'
	 '515cf6447368b8f03a8392ee54fe35b3bd6e3a91f8de3ebbc2fd8403310d6d8d')

install=mumax3.install

package() {
  mkdir -p ${pkgdir}/opt/mumax3/ 
  cp ${srcdir}/mumax3.10_linux_cuda11.0/mumax3{,-server,-convert} ${pkgdir}/opt/mumax3
  install -Dm644 "$srcdir/$pkgname-user.conf" "$pkgdir/usr/lib/sysusers.d/mumax3.conf"
  install -Dm644 "$srcdir/$pkgname-dir.conf" "$pkgdir/usr/lib/tmpfiles.d/mumax3.conf"
  install -Dm644 "$srcdir/mumax3@.service" "$pkgdir/usr/lib/systemd/system/mumax3@.service"
}

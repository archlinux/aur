# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: N30N <archlinux@alunamation.com>
# vim:set ts=2 sw=2 et ft=sh tw=100: noexpandtab

pkgname="mypaint-brushes-deevad"
pkgver=6
pkgrel=2
pkgdesc="Mypaint brushkit by David Revoy"
#url="http://www.davidrevoy.com/?article55/mypaint-v4-brushkit"
url='http://www.davidrevoy.com/article142/mypaint-v6-brushkit'
license=("CCPL:by")
arch=("any")
depends=("mypaint>1.0.0")
#source=("$pkgname-$pkgver.zip::http://www.deviantart.com/download/335059175/mypaint_v6_brushkit_by_deevad-d5jhhbb.zip")
source=($pkgname-$pkgver.zip::http://fc02.deviantart.net/fs70/f/2012/303/9/a/mypaint_v6_brushkit_by_deevad-d5jhhbb.zip)
install="mypaint-brushes-deevad.install"
opttions=(!strip)
build(){
  cd "$srcdir"
  # cleaning install file
  :>"$startdir"/$pkgname.install
  cat <<-EOF > "$startdir/$pkgname.install"
		pre_install() {
			{
				echo "# $pkgname start."
				echo "$(cat $srcdir/order.conf)"
				echo "# $pkgname end."
			} >> /usr/share/mypaint/brushes/order.conf
		}

		pre_upgrade() {
			sed "/^# $pkgname start.$/,/^# $pkgname end.$/d" -i /usr/share/mypaint/brushes/order.conf
		}

		pre_remove() {
			pre_upgrade $1
		}
EOF
}
package() {
  cd "$srcdir"/deevad-v$pkgver
  install -dm755 "$pkgdir"/usr/share/mypaint/brushes/deevad-v$pkgver
	# install brushes and fix permissions
  install -Dm644 "$srcdir"/deevad-v$pkgver/*.{myb,png} \
    "$pkgdir"/usr/share/mypaint/brushes/deevad-v$pkgver/
}
md5sums=('b1f7eab7b919c475ecd4d872363787b1')

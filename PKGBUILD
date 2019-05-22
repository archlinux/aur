# Contributor: Maxim Devaev <mdevaev@gmail.com>

pkgname=packer-kit
pkgver=20190522
pkgrel=1
pkgdesc="Bash wrapper for pacman and AUR (fork of github.com/keenerd/packer)"
url="http://github.com/pi-kvm/packer-kit"
license=(GPL3)
arch=(any)
depends=(jshon expac)
optdepends=(sudo customizepkg)
install=$pkgname.install
source=(packer pkg-install packer.8)
md5sums=(SKIP SKIP SKIP)


build() {
	cd $srcdir
	cp packer packer-user
	sed -i \
			-e "s|packer |packer-user |g" \
			-e "s|makepkg \$MAKEPKGOPTS |chown -R packer:packer \$dir; makepkg \$MAKEPKGOPTS |g" \
			-e "s|makepkg \$MAKEPKGOPTS --asroot -f|sudo -u packer makepkg \$MAKEPKGOPTS -f|g" \
		packer-user
}

package() {
	cd $srcdir
	install -D -m755 packer "$pkgdir/usr/bin/packer"
	install -D -m755 packer-user "$pkgdir/usr/bin/packer-user"
	install -D -m755 pkg-install "$pkgdir/usr/bin/pkg-install"
	install -D -m644 packer.8 "$pkgdir/usr/share/man/man8/packer.8"
}

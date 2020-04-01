# Maintainer: Greg Brown <greg.brown.00 at outlook dot com>
pkgname=dracut-sshd-git
pkgver=r56.cac3a8f
pkgrel=1
pkgdesc="Provide SSH access to initramfs."
arch=(any)
url="https://github.com/gsauthof/dracut-sshd"
license=(GPL3)
groups=()
depends=(dracut openssh)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/gsauthof/dracut-sshd.git'
        'sshd.service.patch'
        'module-setup.sh.patch')
noextract=()
md5sums=('SKIP'
         'ab118699b8d2f24d7ffffd7c0366ba02'
         'd0267f5a2b8cb592a0bf80cd2cfd682a')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch --forward --strip=1 --input="$srcdir/sshd.service.patch"
  patch --forward --strip=1 --input="$srcdir/module-setup.sh.patch"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dt "$pkgdir/usr/lib/dracut/modules.d/46sshd" 46sshd/*
}

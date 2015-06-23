# Contributor: Vojtech Kral <vojtech_kral^hk>

pkgname=kfortune-git
pkgver=r40.15e546c
pkgrel=1
pkgdesc="kernel-space remake of the popular fortune program"
arch=('i686' 'x86_64')
url="https://github.com/vojtechkral/kfortune"
license=('GPL')

makedepends=('git')
install=install
source=('git+https://github.com/vojtechkral/kfortune.git')
sha256sums=('SKIP')

_gitname="kfortune"

pkgver()
{
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
	cd "${srcdir}/${_gitname}"
	make
}

package()
{
	cd "${srcdir}/${_gitname}"
	install -D -m 755 'kfortune.ko' "$pkgdir/usr/lib/modules/`uname -r`/kernel/drivers/char/kfortune.ko"
	install -D -m 644 'kfortune.6.gz' "$pkgdir/usr/share/man/man6/kfortune.6.gz"
}

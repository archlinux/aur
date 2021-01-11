# Maintainer: Kian Kasad <kian at kasad.com>
pkgname=mkinitcpio-encrypt-bootsplash
pkgver=2
pkgrel=1
pkgdesc="a mkinitcpio hook to pause bootsplash for LUKS password input"
arch=(x86_64)
url="https://github.com/archlinux/svntogit-packages/tree/packages/cryptsetup/trunk"
license=('GPL')
depends=(cryptsetup linux-bootsplash)
source=(
	'encrypt-hook'
	'encrypt-hook.diff'
	'encrypt-install'
)
sha256sums=('416aa179ce3c6a7a5eee0861f1f0a4fafac91b69e84a2aae82b6e5a6140e31e2'
            'ce0edec30abd79e7f72de45d37beb0de6aefea6242a7b5057a51289ca0a7f387'
            'd325dc239ecc9a5324407b0782da6df2573e8491251836d6c4e65fa61339ce57')
install=$pkgname.install

prepare() {
	cd "$srcdir"

	mkdir -p $pkgname
	cp encrypt-hook encrypt-install -t $pkgname

	cd $pkgname
	patch -Np1 -i ../encrypt-hook.diff
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 0644 encrypt-hook -T "$pkgdir"/usr/lib/initcpio/hooks/encrypt-bootsplash
	install -Dm 0644 encrypt-install -T "$pkgdir"/usr/lib/initcpio/install/encrypt-bootsplash
}

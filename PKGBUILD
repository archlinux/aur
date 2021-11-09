# Maintainer: Hec <hec@heccraft.com>
_pkgname=zfs-multi-mount
pkgname=zfsmultimount-git
pkgver=0.1.r7.d2c39d9
pkgrel=2
pkgdesc="A mkinitcpio hook to use gbytedev's zfs-multi-mount script"
arch=(any)
url="https://github.com/gbytedev/zfs-multi-mount"
license=('GPL')
install="$pkgname.install"
groups=()
depends=('zfs-utils' 'bash')
makedepends=('git')
source=("git+$url"
        "hook.zfsmultimount"
	    "install.zfsmultimount")
noextract=()
sha256sums=('SKIP'
            '536e8bb4722e263dbccee8dda16402321286f5d5bbf8f4bb2d9dc39432c6b1ad'
		    '97bae903540a2ef8fc08d6d5331f3c1fd2c96b9cab8586a4a72cf3f99f6df7ce')

pkgver() {
	cd "${_pkgname}"
    printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cp hook.zfsmultimount $_pkgname
	cp install.zfsmultimount $_pkgname
	cd $_pkgname
	mkdir -p "$pkgdir"/opt/"$pkgname"
	mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/lib/initcpio/install
	mkdir -p "$pkgdir"/usr/lib/initcpio/hooks
	cp -rf * "$pkgdir"/opt/"$pkgname"
	cp "$pkgdir"/opt/"$pkgname"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
	cp "$pkgdir"/opt/"$pkgname"/zfs-multi-mount.sh "$pkgdir"/usr/bin/zfs-multi-mount
	cp "$pkgdir"/opt/"$pkgname"/install.zfsmultimount "$pkgdir"/usr/lib/initcpio/install/zfsmultimount
	cp "$pkgdir"/opt/"$pkgname"/hook.zfsmultimount "$pkgdir"/usr/lib/initcpio/hooks/zfsmultimount
}

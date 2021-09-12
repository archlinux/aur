# Maintainer: Alice S. <quarkyalice@disroot.org>
# Contributor: Stefano Capitani <stefanoatmanjarodotorg>

pkgname=kernel-alive
_clean=linux-module-cleanup
pkgver=0.5
pkgrel=1
pkgdesc="Back up modules of current kernel to prevent some issues after kernel update"
url="https://gitlab.manjaro.org/ste74/$pkgname"
_commit=ab1144da0459bacaf27bcfdf5201b9019e5d2795
arch=(any)
license=(GPL3)
source=("$url/-/archive/$_commit/$pkgname-$_commit.tar.gz")
depends=('rsync')
md5sums=('42821deaf25410646763705f447307cc')

package() {
	cd $pkgname-$_commit
	
#install systemd service
	install -Dm755 $_clean.script $pkgdir/usr/bin/$_clean
	install -Dm644 $_clean.service $pkgdir/etc/systemd/system/$_clean.service

#install hook and script	
	install -Dm644 $pkgname-pre.hook ${pkgdir}/usr/share/libalpm/hooks/$pkgname-pre.hook
	install -Dm644 $pkgname-post.hook ${pkgdir}/usr/share/libalpm/hooks/$pkgname-post.hook
	install -Dm644 $pkgname-install.hook ${pkgdir}/usr/share/libalpm/hooks/$pkgname-install.hook
	install -Dm644 $pkgname-remove.hook ${pkgdir}/usr/share/libalpm/hooks/$pkgname-remove.hook
	
	install -Dm755 $pkgname-pre.script ${pkgdir}/usr/share/libalpm/scripts/$pkgname-pre
	install -Dm755 $pkgname-post.script ${pkgdir}/usr/share/libalpm/scripts/$pkgname-post
	install -Dm755 $pkgname-remove.script ${pkgdir}/usr/share/libalpm/scripts/$pkgname-remove
}

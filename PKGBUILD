# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer-profiles-git
pkgver=r16.a95ec3a
pkgrel=1
pkgdesc="predefined printer profiles for SuperSlicer"
arch=('any')
url="https://github.com/slic3r/slic3r-profiles"
license=('AGPL3')
makedepends=('git')
provides=("superslicer-profiles=$epoch:$pkgver")
source=("slic3r-profiles::git+https://github.com/slic3r/slic3r-profiles.git")
sha512sums=('SKIP')


pkgver()
{
	cd "$srcdir/slic3r-profiles"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
	install -d "$pkgdir/usr/share/SuperSlicer/profiles"
	cp -r "$srcdir/slic3r-profiles" -T "$pkgdir/usr/share/SuperSlicer/profiles"
	chmod -R 644 "$pkgdir/usr/share/SuperSlicer/profiles"
	find "$pkgdir/usr/share/SuperSlicer/profiles" -type d -exec chmod 755 {} \;
}

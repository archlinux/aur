# Maintainer: ssf <punx69 at gmx dot net>

pkgname=('lxqt-theme-aalglatt')
pkgver=0.10
pkgrel=1
pkgdesc='simple LXQt-theme made for the use with a composite manager'
arch=('any')
url='http://sixsixfive.deviantart.com/art/Aalglatt-584977881'
license=("CCPL:cc-by-sa-4.0")
makedepends=('subversion')
pkgdepends=('lxqt-config')
_svnmod="aalglatt"
_svntrunk=https://github.com/sixsixfive/misc/trunk/themes/lxqt/$_svnmod

build() {
	cd "${srcdir}"
	msg "Connecting to SVN server...."
	if [ -d "$_svnmod/.svn" ]; then
		(
		cd "$_svnmod"
		svn status --config-dir "$srcdir" --no-ignore | grep -E '(^\?)|(^\I)|(^\M)' | sed -e 's/^. *//' | sed -e 's/\(.*\)/"\1"/' | xargs rm -drf
		svn up . --config-dir
		)
	else
		svn co "$_svntrunk" --config-dir "$srcdir" "$_svnmod"
	fi
	msg "SVN checkout done or server timeout"
}

package() {
	install -d "${pkgdir}"/usr/share/lxqt/themes
	mv "${srcdir}"/"${_svnmod}" "${pkgdir}"/usr/share/lxqt/themes
	rm -rf "${pkgdir}"/usr/share/lxqt/themes/"${_svnmod}"/.svn
}

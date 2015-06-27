# $Id$
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgbase=etc-update
pkgname=('etc-update')
pkgdesc="CLI to interactively merge *.pacnew in /etc"
pkgver=13723
pkgrel=9
arch=('any')
url="http://www.gentoo.org/doc/en/handbook/handbook-amd64.xml?part=3&chap=4#doc_chap2"
license=('GPL')
depends=('diffutils')
makedepends=('diffutils' 'patch')
options=()
source=(
	etc-update-arch_port.patch
	etc-update.gentoo
	etc-update.conf
)
md5sums=(
	'e1ae7d15f9ee7ad276c7d486cd597a34'
	'85b9025638ead2d9db9322bb22c53d75'
	'a36bb6f6363a429a0cedd8bcab235fff'
)
#_svntrunk=svn://anonsvn.gentoo.org/portage/main/trunk/

prepare() {
  cd "${srcdir}"

#  msg "Downloading base versions from Gentoo SVN..."
#  svn export ${_svntrunk}bin/etc-update
#  svn export ${_svntrunk}cnf/etc-update.conf
  mv etc-update.gentoo etc-update

  msg "Applying Gentoo -> Arch conversion patch..."
  patch --follow-symlinks -i "${srcdir}/etc-update-arch_port.patch"
}

package() {
  cd "${srcdir}"
  install -D -m644 etc-update.conf "${pkgdir}/etc/etc-update.conf"
  install -D -m755 etc-update "${pkgdir}/usr/bin/etc-update"
}

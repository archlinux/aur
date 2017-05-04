# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=aif-git
pkgver=r44.0e3b457
pkgrel=1
pkgdesc="An XML and python-driven rebirth of the AIF (Arch Installation Framework) project."
arch=( 'i686' 'x86_64' )
url="https://aif.square-r00t.net/"
license=( 'GPL3' )
depends=( 'python' 'arch-install-scripts' 'parted' 'gptfdisk' )
optdepends=( 'python-lxml: better xml handling' )
conflics=( 'aif' )
_pkgname=aif
install=
changelog=
noextract=()
source=("aif::git+https://git.square-r00t.net/AIF-NG")
# see https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git_Submodules if you require git submodules
sha512sums=('SKIP')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  # no tags, so number of revisions e.g. r1142.a17a017
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ## most recent annotated tag e.g. 2.0.r6.ga17a017
  #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  ## most recent un-annotated tag e.g. 0.71.r115.gd95ee07
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  ## or:
  ##git describe --long --tags | sed 's/-/.r/;s/-/./'
  ## project uses tags with prefix. e.g. v...
  #git describe --long | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  ## both with fallback, e.g. 0.9.9.r27.g2b039da with tags, else r1581.2b039da
  #( set -o pipefail
  #  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  #  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #)
}

package() {
        install -D -m0755 ${srcdir}/${_pkgname}/${_pkgname}client.py ${pkgdir}/usr/bin/${_pkgname}
        install -D -m0755 ${srcdir}/${_pkgname}/${_pkgname}verify.py ${pkgdir}/usr/bin/${_pkgname}-verify
        install -D -m0644 ${srcdir}/${_pkgname}/${_pkgname}.xml ${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}.xml
        install -D -m0644 ${srcdir}/${_pkgname}/${_pkgname}.xsd ${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}.xsd
        install -D -m0644 ${srcdir}/${_pkgname}/HOWTO ${pkgdir}/usr/share/doc/${_pkgname}/HOWTO
        install -D -m0644 ${srcdir}/${_pkgname}/TODO ${pkgdir}/usr/share/doc/${_pkgname}/TODO
	# TODO: xml linter, script samples. and docs, when i write them.
}

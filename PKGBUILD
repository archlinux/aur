# Maintainer: DATSD <dastudiodirector at gmail dot com>
_basename=factorio-mod-info
pkgname=${_basename}-headeronly-git
pkgver=0.1.2.r2
pkgrel=1
pkgdesc="A C ++ library that retrieves Factorio\'s Mod information (header only)"
arch=('i686' 'x86_64')
url='https://github.com/745275633/Factorio-Mod-info'
license=('GPL')
depends=('boost' 'openssl' 'avhttp' 'da-exception')
optdepends=('yaml-cpp')
makedepends=('xmake>=2.1.4.r178' 'git')
provides=(${_basename}=${pkgver})
conflicts=(${_basename})
source=("${_basename}::git+https://github.com/745275633/Factorio-Mod-info.git#branch=header-only")
sha256sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${_basename}"
	git describe --long --tags | sed 's/\([^-]*\)-g.*/r\1/;s/-/./g' | cut -c2-
}

build()
{
	cd "${srcdir}/${_basename}"
	xmake build
}

package()
{
	cd "${srcdir}/${_basename}"
	xmake install --installdir="${pkgdir}/usr" --root
}

# Maintainer: Uffe Jakobsen _<_uffe_at_uffe_dot_org_>_
pkgname=proploader-git
_gitname=PropLoader
pkgver=v1.0.37.r15.ga1b4cd8
pkgrel=1
pkgdesc="Parallax Propeller loader supporting both serial and wifi downloads"
arch=('x86_64' 'i686')
url="https://github.com/parallaxinc/PropLoader"
license=('LicenseRef-MIT')
groups=()
depends=()
makedepends=('openspin')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/parallaxinc/${_gitname}")
sha256sums=('SKIP')


pkgver()
{
  cd "${srcdir}/${_gitname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	cd "${srcdir}/${_gitname}"
	make OS=linux BUILD="${PWD}/build" GITDESC="${pkgver}"
}

package()
{
	cd "${srcdir}/${_gitname}"
  install -Dm 755 "build/bin/proploader" "${pkgdir}/usr/bin/proploader"
  install -Dm 755 "build/bin/split" "${pkgdir}/usr/bin/proploader-split"
  install -Dm 755 "build/bin/split" "${pkgdir}/usr/bin/proploader-split"
  install -Dm 755 "build/blink-fast.binary" "${pkgdir}/usr/share/proploader/blink-fast.binary"
  install -Dm 755 "build/blink-slow.binary" "${pkgdir}/usr/share/proploader/blink-slow.binary"
  install -Dm 755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

#
# EOF
#

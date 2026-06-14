# Maintainer: banana-bred  <j.forer@posteo.net>
pkgname=tems-git
_name="${pkgname%*-git}"
pkgver=r1.a248415
pkgrel=1
epoch=
pkgdesc="Terminal ElectroMagnetic Spectrum reference"
arch=('x86_64')
url="https://github.com/banana-bred/tems"
license=('MIT')
depends=(libgfortran libgcc glibc)
makedepends=(gcc-fortran git)
provides=(tems)
conflicts=(tems)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_name}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_name}"
  gfortran $LDFLAGS -O2 -Wall -ffree-form -o "$_name" "main/$_name.f"
}

package() {
	cd "${srcdir}/${_name}"
	install -D -m755 "$_name" "${pkgdir}/usr/bin/${_name}"
	install -D -m644 "${srcdir}/${_name}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

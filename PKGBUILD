# Maintainer: liv <aur@insects.institute>
pkgname=gg-jujutsu-bin
pkgver=0.36.2
pkgrel=1

pkgdesc='A GUI for the version control system Jujutsu. (binary version)'
arch=(x86_64)
url='https://github.com/gulbanana/gg'
license=(Apache-2.0)
depends=(
  gdk-pixbuf2
  glibc
  glib2
  gtk3
  pango
  webkit2gtk-4.1
)
provides=(gg-jujutsu)
conflicts=(
	gg-jujutsu
)
options=(
	!strip
	!emptydirs
)

source=(
	"${pkgname}-${pkgver}.deb::https://github.com/gulbanana/gg/releases/download/v${pkgver}/gg_${pkgver}_amd64.deb"
	"${pkgname}-${pkgver}.LICENSE::https://raw.githubusercontent.com/gulbanana/gg/refs/tags/v${pkgver}/LICENSE"
)
b2sums=('c2e25afb638cc5724c1afe2202caa5cac053eb86c4263f650aa3873eb29684ec6ff407e39a6ac47e72014d3c0227ed77c74bdfcefcf3d3761228c46e7c419237'
        '1bbdb8ea81b42a8ce554f92fd57009eef6b296472f910c5542d8a445e34bb0eee0e627a74462b9f453fe9d8853bde71fdb0eea11102bb604129753de6ecc6e06')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}/"
}

package() {
	cp -a \
		"${srcdir}/usr/" \
		"${pkgdir}/usr/"
	install -Dm644 \
		"${srcdir}/${pkgname}-${pkgver}.LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: liv <aur@insects.institute>
pkgname=gg-jujutsu-bin
pkgver=0.37.2
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
b2sums=('eae4a957ba93f7e7bf2a37d3d85ae398b0d289871befaad2de26f00077aee63a58fa7c2d6613702868b9b113b6af60c0f122546b4315740b69db205d732b2cdc'
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

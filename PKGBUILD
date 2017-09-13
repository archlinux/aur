# Contributor: maz-1 <loveayawaka_at_gmail_dot_com>
# Contributor: eimis
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=gimp-apng
pkgver=0.1.0
pkgrel=7
pkgdesc="A GIMP plugin to support animated PNG (APNG)."
url="http://sourceforge.net/projects/gimp-apng/"
makedepends=("intltool")
depends=("gimp>=2.6.0" "libpng")
arch=("i686" "x86_64")
license=("GPL")
provides=("gimp-plugin-apng" "gimp-apng")
conflicts=("gimp-plugin-apng")
source=("http://downloads.sourceforge.net/project/gimp-apng/gimp-apng-dev/0.1.0/${pkgname}-${pkgver}.tar.bz2")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
  	--bindir=/usr/bin \
  	--sbindir=/usr/bin \
  	--libdir=/usr/lib \
  	--libexecdir=/usr/lib/gimp-2.0

  make prefix=/usr \
  	bindir=/usr/bin \
  	sbindir=/usr/bin \
  	libdir=/usr/lib \
	libexecdir=/usr/lib/gimp-2.0 \
	DESTDIR="${pkgdir}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make prefix=/usr \
  	bindir=/usr/bin \
  	sbindir=/usr/bin \
  	libdir=/usr/lib \
  	libexecdir=/usr/lib/gimp-2.0 \
  	DESTDIR="${pkgdir}" install

# Stupid Makefile, not install things correctly, help?
  mkdir -p "${pkgdir}/usr/lib/gimp/2.0/plug-ins/"
  mv "${pkgdir}/usr/bin/file-apng" \
	"${pkgdir}/usr/lib/gimp/2.0/plug-ins/"
  rmdir "${pkgdir}/usr/bin/"

  mkdir -p "${pkgdir}/usr/share/gimp/2.0/ui/"
  cp "${pkgdir}/usr/share/gimp-apng/ui/plug-ins/plug-in-file-apng.ui" \
  	"${pkgdir}/usr/share/gimp/2.0/ui"
}

md5sums=('af83f8dfc6cfedc9ce3e898d1eef1768')

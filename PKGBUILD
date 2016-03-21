# Maintainer:	Jesse Jaara	<gmail.com:	jesse.jaara>
# Contributor:	Det		<gmail.com:	nimetonmaili>
# Contributor:	h31		<yandex.com:	h31mail>
# Contributor:	julroy67	<gmail.com:	julroy67>

pkgname=libvpx-git
pkgver=v1.5.0.621.gbfc2a7e
pkgrel=1
pkgdesc="The VP8, VP9 & VP10 Codec SDK (git version)"
arch=('i686' 'x86_64')
url="http://www.webmproject.org/"
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'yasm')
provides=('libvpx=1.5.0')
conflicts=('libvpx')
source=('git+https://chromium.googlesource.com/webm/libvpx')
md5sums=('SKIP')
_gitname='libvpx'

pkgver() {
  cd ${_gitname}
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${_gitname}"

    ./configure --prefix=/usr \
	--enable-vp8 \
	--enable-vp9 \
        --enable-vp9-highbitdepth \
        --enable-vp10 \
        --enable-runtime-cpu-detect \
        --enable-shared \
        --enable-postproc \
        --enable-pic \
        --enable-experimental \
        --enable-spatial-svc \
        --disable-install-docs \
        --disable-install-srcs

  make
}

package() {
  cd "${srcdir}/${_gitname}/"

  make DIST_DIR="${pkgdir}/usr" install
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

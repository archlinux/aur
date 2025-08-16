# Maintainer: nafets227 <nafets227@users.noreply.github.com>
pkgname=vdr-softhddevice-drm-gles
pkgver=r981.4306716
pkgrel=1
_vdrapi=9
pkgdesc="VDR output plugin for software HD based on DRM interface"
arch=('aarch64')
license=('AGPL3')
depends=('ffmpeg' "vdr-api=${_vdrapi}" 'alsa-lib' 'glm')  # mesa-utils glu libva-mesa-driver
source=(
	"${pkgname}::git+https://github.com/rellla/vdr-plugin-softhddevice-drm-gles.git"
	fix-compiler.patch
	)
sha256sums=(
	'SKIP'
	cb995a0efd779e92556e45267589f20a27bed035c4be80229cdeb83d0b89f08f
	)

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgbase}"
  head -190 misc.h | tail -20
  patch -p1 -i "$srcdir/fix-compiler.patch"
}

build() {
  cd "$srcdir/${pkgname}"
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="$pkgdir/" install
}


# Maintainer : Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

_name=CinelerraCV
pkgname=cinelerra-cv
pkgver=2.3.20181006
pkgrel=2
revision=bbcaf2fa70d6acb0ab764e853d50e6aa04e16496
epoch=1
pkgdesc="Professional video editing and compositing environment - Community version"
arch=('x86_64')
url="https://github.com/cinelerra-gg/cinelerra-cv/"
license=('GPL')
depends=('e2fsprogs' 'libavc1394' 'libiec61883' 'libxv'
         'libtiff' 'mjpegtools' 'fftw' 'a52dec' 'glu'
         'ffmpeg' 'faad2' 'faac' 'openexr>=2.0.0' 'libxft')
makedepends=('git' 'automake' 'git' 'nasm' 'mesa')
source=("git+https://github.com/cinelerra-gg/cinelerra-cv.git#commit=bbcaf2fa70d6acb0ab764e853d50e6aa04e16496")
sha512sums=('SKIP')

prepare() {
  cd "${pkgname}"
  ./autogen.sh
}

build() {
  cd "${pkgname}"
  # disable mmx due to improper use of registers in asm
  # - possibly a new problem since gcc 4.9
  ./configure pkg_config='pkg-config --static' \
	      --prefix=/usr \
	      --enable-opengl \
              --disable-mmx \
              --disable-esd
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="$pkgdir" install
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 {AUTHORS,ChangeLog,NEWS,README.BUILD,TODO}
}

# vim:set ts=2 sw=2 et:

# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname='atari++'
pkgver='1.84'
pkgrel='1'
pkgdesc='An emulator of Atari 400/800/400XL/800XL/130XE/5200'
arch=('i686' 'x86_64')
url='http://www.xl-project.com'
license=('custom:TPL')
depends=('sdl' 'libpng' 'alsa-lib' 'gcc-libs' 'libsm')
makedepends=('tar')
source=("${url}/download/${pkgname}_${pkgver}.tar.gz")
md5sums=('569288245236971b7f6115812fb745b1')
sha256sums=('25964db2eb26f6f7aa58eee3c88bb9886738c304176f75b72b80a813dcbf9c36')
noextract=("${pkgname}_${pkgver}.tar.gz") # bsdtar: atari++/winmain.cpp: Skipping hardlink pointing to itself

prepare() {
  tar -xzf "${pkgname}_${pkgver}.tar.gz"
}

build() {
  cd "${pkgname}"
  ./configure --prefix='/usr'
  make DESTDIR="${pkgdir}"
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 'README.licence' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

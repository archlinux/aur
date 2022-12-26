# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname='atari++'
pkgver='1.85'
pkgrel='1'
pkgdesc='An emulator of Atari 400/800/400XL/800XL/130XE/5200'
arch=('i686' 'x86_64')
url='http://www.xl-project.com'
license=('custom:TPL')
depends=('sdl' 'libpng' 'alsa-lib' 'gcc-libs' 'libsm')
makedepends=('tar')
source=("${url}/download/${pkgname}_${pkgver}.tar.gz")
md5sums=('2d71eaebe7bc6527fbcecc94b74a1093')
sha256sums=('2db193554b355d747e41f0e10b15fd50c910ddb9e4e33d1c925f780b0c1ef484')
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

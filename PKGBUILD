# Maintainer: Dae Euhwa <daedaevibin@naver.com>

pkgname=bdf2psf-latest
pkgver=1.246
pkgrel=2
epoch=1
pkgdesc="Debian utility to convert BDF font files to PSF format"
arch=('any')
url="https://packages.debian.org/unstable/bdf2psf"
license=('GPL-2.0-or-later')

depends=('perl' 'libbsd')

source=(
  "https://deb.debian.org/debian/pool/main/c/console-setup/bdf2psf_${pkgver}_all.deb"
  "0001-print-help-when-no-args-provided.patch"
)

b2sums=('4693d83c0a848a3aed5936a12217cb1cdd936c3b43a32eb3fb8f32dac0ae78726eabc44cff192286378a273e1ae00d52bb61d72fe8fbc42772ae9fb982ffe1b7'
        '332248177ed0f2caf12fe4d2ccc44d973b52ba9c6c47735976e281e5a05cf43ff375e7a68ec7fe07f0d7c7a7c363e0bd68f7b3a723ed1287063443ce456fe071')

prepare() {
  cd "$srcdir"

  # Extract Debian package
  bsdtar -xf "bdf2psf_${pkgver}_all.deb"
  bsdtar -xf data.tar.xz

  # Apply patch to binary wrapper/script
  patch -Np1 -i "$srcdir/0001-print-help-when-no-args-provided.patch"
}

package() {
  cd "$srcdir"

  # Install binary
  install -Dm755 usr/bin/bdf2psf \
    "$pkgdir/usr/bin/bdf2psf"
}

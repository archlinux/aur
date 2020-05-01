# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=gimp-plugin-wavelet-denoise
pkgver=0.3.1
pkgrel=5
pkgdesc="Tool to reduce noise in each channel of an image separately"
arch=('x86_64')
url="https://registry.gimp.org/node/4235"
license=('GPL')
depends=('gimp')
source=(https://raw.githubusercontent.com/pixlsus/registry.gimp.org_static/master/registry.gimp.org/files/wavelet-denoise-$pkgver.tar.gz \
        po_install.diff libm_buildfix.diff)
md5sums=('a02862026857575cdf81b24477e42f4b'
         '4de9e41a535f200c2502f0dd8458c43e'
         '46940ecd5970bc4b0d4b38de89f8efbf')

build() {
  cd "$srcdir/wavelet-denoise-$pkgver"

  patch -Np1 < ../po_install.diff || true
  patch -Np1 < ../libm_buildfix.diff || true
  make
}

package() {
  cd "$srcdir/wavelet-denoise-$pkgver"

  install -Dvm755 src/wavelet-denoise \
    "$pkgdir"/usr/lib/gimp/2.0/plug-ins/wavelet-denoise
  cd po
  make LOCALEDIR="$pkgdir"/usr/share/locale install
}

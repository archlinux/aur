    # Maintainer: fettouhi <A.Fettouhi@gmail.com>
    # Contributor: Neverth <t-r-a-y@mbnet.fi>
    # Contributor: Marvn
     
    pkgname=moodbar
    pkgver=1.3.0
    pkgrel=1
    pkgdesc="moodbar binaries and script for Amarok"
    arch=(i686 x86_64)
    url="https://github.com/exaile/moodbar/releases"
    license=('GPL')
    depends=('fftw'  'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-bad' 'gst-plugins-good' 'gst-plugins-ugly')
    makedepends=('meson')
    source=("https://github.com/exaile/moodbar/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
    sha256sums=('3fadae175c9986278da0f008a4d1c6df9387d6a0ed5056dd3927733e7b78363c')
    
    build() {
      cd ${srcdir}/${pkgname}-${pkgver}
      meson --prefix /usr --buildtype plain _build
      ninja -C _build
    }

    package() {
      cd ${srcdir}/${pkgname}-${pkgver}
      DESTDIR="$pkgdir" ninja -C _build install
      mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
      install -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname"
    }

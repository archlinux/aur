    # Maintainer: fettouhi <A.Fettouhi@gmail.com>
    # Contributor: Neverth <t-r-a-y@mbnet.fi>
    # Contributor: Marvn
     
    pkgname=moodbar
    pkgver=1.0
    pkgrel=1
    pkgdesc="moodbar binaries and script for Amarok"
    arch=(i686 x86_64)
    url="https://github.com/exaile/moodbar/releases"
    license=('GPL')
    depends=('fftw'  'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-bad' 'gst-plugins-good' 'gst-plugins-ugly')
    makedepends=('meson')
    source=("https://github.com/exaile/moodbar/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
    sha256sums=('17585aa621c2b34ac6f93d2b749f561138411d0c27a7719012f37adcaaffda95')
    
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

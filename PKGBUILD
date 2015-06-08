    # Contributor: Neverth <t-r-a-y@mbnet.fi>
    # Contributor: fettouhi <A.Fettouhi@gmail.com>
    # Contributor: Marvn
     
    pkgname=moodbar
    pkgver=0.1.2
    pkgrel=10
    pkgdesc="moodbar binaries and script for Amarok"
    arch=(i686 x86_64 armv6h)
    url="http://pkgs.fedoraproject.org/repo/pkgs/moodbar/moodbar-0.1.2.tar.gz/28c8eb65e83b30f71b84be4fab949360/"
    license=('GPL')
    depends=('gstreamer0.10' 'fftw' 'gstreamer0.10-bad-plugins' 'gstreamer0.10-good-plugins' 'gstreamer0.10-ugly-plugins' 'gstreamer0.10-ffmpeg' 'gstreamer0.10-base-plugins')
    makedepends=('pkgconfig' 'make')
    source=("http://pkgs.fedoraproject.org/repo/pkgs/moodbar/moodbar-0.1.2.tar.gz/28c8eb65e83b30f71b84be4fab949360/${pkgname}-${pkgver}.tar.gz"
            "analyzer.patch")
    sha256sums=('3d53627c3d979636e98bbe1e745ed79e98f1238148ba4f8379819f9083b3d9c4'
             '2a3479f046f3aa0e36b90b832a9fb83763946ee09e001d3143577a3d2f518881')
     
    build() {
      cd ${srcdir}/${pkgname}-${pkgver}
     
      patch -p1 -i ../analyzer.patch
      ./configure --prefix=`pkg-config --variable=prefix gstreamer-0.10`
     
      make
    }
     
    package() {
      cd ${srcdir}/${pkgname}-${pkgver}
     
      make DESTDIR="$pkgdir" install
    }

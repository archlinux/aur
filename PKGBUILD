pkgname=apt-move
pkgver=4.2.27
pkgrel=1
pkgdesc='Maintain Debian packages in a package pool'
url='https://packages.debian.org'
arch=('x86_64')
license=('GPL')
depends=('bc'
         'gawk'
         'apt'
         )
source=("http://deb.debian.org/debian/pool/main/a/apt-move/apt-move_${pkgver}.orig.tar.gz"
        "https://sources.debian.org/data/main/a/apt-move/4.2.27-6/debian/patches/csum-uncompressed-Packages.patch"
        "https://sources.debian.org/data/main/a/apt-move/4.2.27-6/debian/patches/fix-dpkg-option.patch"
        "https://sources.debian.org/data/main/a/apt-move/4.2.27-6/debian/patches/add-copydir.patch"
        "https://sources.debian.org/data/main/a/apt-move/4.2.27-6/debian/patches/fix_perl_implicit_split_deprecation.patch"
        "https://sources.debian.org/data/main/a/apt-move/4.2.27-6/debian/patches/fix-makefile.patch"
        "https://sources.debian.org/data/main/a/apt-move/4.2.27-6/debian/patches/drop-contents-header.patch"
        "https://sources.debian.org/data/main/a/apt-move/4.2.27-6/debian/patches/apt-1.9.patch"
        )
sha256sums=('5d216b0ce87b5f7345c4c6c8aadf5ce475443c32f3b43b5a34a4f2bb9b59b281'
            'ee4954bd7e792b67f0e4be6bf49b4eadf3dbdf33ab5c0ec33efdd8f24201ef0b'
            '4a41655fee8764a3b0e1752cfd38b93bd7579f3765f8202548a0f2f61cf651d7'
            'd354e80d21511df8143ae630fef49a97dff24a7adc3de47f57d732ec682bf51d'
            '57b4a6dcd3805cbdbd6d4f1b7af5e5b02bf8e57f6df7a9ad19994017cff87667'
            'c5c2161615210418b1478dd39b1fd70b7cd317c1f044ad369b2ad5663fb5b1fa'
            '850a564de19d532771e80428f8bcca0b4c861fd30d297a27d0e6ad1d58ef2e0f'
            '051c11043eb4d9fd496543197faf60ad24ed186efcd17049e116082637bb633b'
            )
backup=('etc/apt-move.conf')

prepare() {
  cd apt-move
  patch -p1 -i "${srcdir}/csum-uncompressed-Packages.patch"
  patch -p1 -i "${srcdir}/fix-dpkg-option.patch"
  patch -p1 -i "${srcdir}/add-copydir.patch"
  patch -p1 -i "${srcdir}/fix_perl_implicit_split_deprecation.patch"
  patch -p1 -i "${srcdir}/fix-makefile.patch"
  patch -p1 -i "${srcdir}/drop-contents-header.patch"
  patch -p1 -i "${srcdir}/apt-1.9.patch"
}

build() {
  cd apt-move
  make
}

package() {
  cd apt-move
  mkdir -p "${pkgdir}"/{etc,usr/bin,usr/lib/apt-move,usr/share/{man/man8,apt-move}}

  make DESTDIR="${pkgdir}" install

  chmod 644 "${pkgdir}"/{etc/apt-move.conf,usr/share/man/man8/apt-move.8}

  install -Dm644 README "${pkgdir}/usr/share/doc/apt-move/README"
}

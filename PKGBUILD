# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: laloch <lalochcz@gmail.com>
pkgname=dsf2flac-svn
pkgver=53
pkgrel=1
pkgdesc="A file conversion tool for translating dsf and dff dsd audio files into flac pcm audio files."
arch=('i686' 'x86_64')
url="https://code.google.com/p/dsf2flac"
license=('GPL3')
depends=('boost-libs' 'flac' 'id3lib')
makedepends=('boost' 'cmake')
source=('dsf2flac.zip::https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/dsf2flac/source-archive.zip'
        'fix-build.patch')
sha512sums=('cd6c49e3a3f61202f0a8309bef55973aad77f8da4f85a8cf39fae9e450422dfc17cc85db8aa5fb43ac4b0405169ae5e1c0ae2db8a0601dc0513d44c86820cdd4'
            '50bbc642225fca1080eee2b5978049057891cec7e2a414081bb9081a3b044b301f9f96fa2ed00e9e200e40b66e8ebf3ea4bece68c8ba83b9809b0fbdf1486e3a')

prepare() {
  cd dsf2flac/trunk
  patch -p1 < "$srcdir"/fix-build.patch
  perl -ne 'print unless /-static/' -i CMakeLists.txt
}

build() {
  rm -fr build
  mkdir build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release "$srcdir"/dsf2flac/trunk
  make
}

package() {
  install -Dm755 build/dsf2flac "$pkgdir/usr/bin/dsf2flac"
}

# vim:set ts=2 sw=2 et:

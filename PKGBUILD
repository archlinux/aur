# Maintainer: jpkotta [at] gmail dot com
# Contributor: jpkotta [at] gmail dot com

pkgname=foldingathome-noroot
pkgver=7.4.4
pkgrel=2
pkgdesc="Folding@Home client that does not run as the root user."
arch=('i686' 'x86_64')
url="http://folding.stanford.edu/"
license=('CUSTOM')
depends=('zlib' 'bzip2' 'bash')
optdepends=('opencl-nvidia: for folding with an nVidia GPU'
            'opencl-mesa: for folding with an AMD GPU')
replaces=('foldingathome-v7' 'foldingathome')
conflicts=('foldingathome-v7' 'foldingathome')
install=foldingathome.install

source=(foldingathome.service fah-config foldingathome.install)
source_i686=("https://fah.stanford.edu/file-releases/public/release/fahclient/debian-testing-32bit/v7.4/fahclient_7.4.4_i386.deb")
source_x86_64=("https://fah.stanford.edu/file-releases/public/release/fahclient/debian-testing-64bit/v7.4/fahclient_7.4.4_amd64.deb")

md5sums=('40530df579e406fa29e6535adf2c0c22'
         'bb0bca34f6f32c8bd46dfcdcd6abe1f6'
         '12accb9cd18aaa13d8b2f1ce6fa169d0')
md5sums_i686=('4aedf35b0adaaa5c8f5e1ce48d591744')
md5sums_x86_64=('10ece2d4a6a4c6a82321683284837b28')

prepare() {
  cd ${srcdir}
  tar xf data.tar.gz
}

package() {
  cd ${srcdir}
  installdir=${pkgdir}/opt/fah/

  install -D -m755 \
          fah-config \
          ${installdir}/fah-config
  install -D -m755 \
          usr/bin/FAHClient \
          ${installdir}/FAHClient
  install -D -m755 \
          usr/bin/FAHCoreWrapper \
          ${installdir}/FAHCoreWrapper
  install -D -m755 \
          usr/share/doc/fahclient/sample-config.xml \
          ${installdir}/sample-config.xml
  install -D -m644 \
          usr/share/doc/fahclient/copyright \
          ${pkgdir}/usr/share/licenses/${pkgname}/copyright
  install -D -m644 \
          usr/share/doc/fahclient/README \
          ${installdir}/README
  install -D -m644 \
          usr/share/doc/fahclient/changelog.gz \
          ${installdir}/changelog.gz
  install -D -m644 \
          foldingathome.service \
          ${pkgdir}/usr/lib/systemd/system/foldingathome.service
}


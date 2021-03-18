# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.16.3
pkgrel=1
pkgdesc='DVD and Blu-ray to MKV converter and network streamer - CLI only'
arch=('i686' 'x86_64')
url='https://www.makemkv.com'
license=('LGPL' 'MPL' 'custom')
depends=('ffmpeg' 'java-runtime')
optdepends_x86_64=('lib32-glibc: dts support')
provides=('makemkv')
conflicts=('makemkv')
install=makemkv.install
source=("${url}/download/makemkv-bin-${pkgver}.tar.gz"
        "${url}/download/makemkv-oss-${pkgver}.tar.gz"
        makemkvcon.1
        mmdtsdec.1)
b2sums=('34cbf3ee5400a21a4c9f3f71e95afeb2129bda69daa4743321c3aff9ad8bf2c8f703fbf63e45720612b5305efb04484fd1a5719af74398fde2a15a3f982d65b4'
        'db1bc32581c86a29b36a4f853395370e7b2d29d65205ff62f67b55cfcb12fb8637cde0c4ff26b15d8f61e36419ea11674547d732b19647e5828d8ab568086c03'
        'a318361982271bee3db2fa6f3e2b51afd7fe35f3dcb821c24bc21f8189be74cf9093559dbf9689eedd458226b30ddf59333af10ef509dc850331639b9035be39'
        '2402c0338cf3a5e28c46af98a72c76e8e22d54e812f1d1f0dc156590657af15a6264a05a5fbcbf288fea09b5f4eb6fd1bb3e8672e9afc1615170b7bd83ba69b1')

build() {
  cd makemkv-oss-${pkgver}
  ./configure --prefix=/usr --disable-gui
  make
}

package() {
  cd makemkv-oss-${pkgver}
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"/makemkv-bin-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 src/eula_en_linux.txt "${pkgdir}"/usr/share/licenses/${pkgname}/eula_en_linux.txt

  cd "${srcdir}"
  install -Dm644 -t "${pkgdir}"/usr/share/man/man1/ makemkvcon.1 mmdtsdec.1
}

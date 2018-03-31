# Maintainer: Jesús E. <heckyel@hyperbola.info>

pkgname=librevideoconverter
pkgver=1.1RC1
pkgrel=1
pkgdesc="Simple video converter for WebM (vp8, vp9), Ogg Theora, MP4 and others, fork of Miro Video Converter"
arch=(any)
url="https://notabug.org/heckyel/librevideoconverter"
license=('GPL3')
depends=('python2>=2.7.0' 'ffmpeg' 'ffmpeg2theora' 'gtk2' 'hicolor-icon-theme' 'pygtk')
makedepends=('python2-distribute')
conflicts=(miro-video-converter)
source=("$pkgname-$pkgver.tar.gz::https://notabug.org/heckyel/librevideoconverter/archive/$pkgver.tar.gz"
        "libre.patch")
sha512sums=('1468f77f553dc67a5a78bdbc11b468c36420bd0949b88b1d87fedf824ebace233f6c94ed59b6f95b80a1abe4e78173ad33747b6648cde37a765a4814675e0f87'
            'b6c372cf5212e77dc41243f9f8236f99ea0afd77e7208d746771697ac7dec2715ab79d77216c8c538fd2d344128be79a28a9a7069d6c42140484d8608fff9933')

prepare() {
  cd ${pkgname}

  #Remove unnecesary directory's
  rm -rv test/
  rm -rv lvc/{osx/,windows/}

  #Patch setup.py only gnu/linux
  patch -Np1 -i "${srcdir}/libre.patch"
}

package() {
  cd ${pkgname}

  python2 setup.py install --root=${pkgdir} --optimize=1
  install -D lvc/resources/images/lvc-logo.png ${pkgdir}/usr/share/icons/lvc-logo.png
  ln -sv libre-video-converter.py "${pkgdir}/usr/bin/libre-video-converter"
}

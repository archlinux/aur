# Maintainer: Ashley Whetter <(firstname) @ awhetter.co.uk>

pkgname=darwinia-demo
pkgver=1.3.0
pkgrel=2
pkgdesc="A virtual themepark, running entirely inside a computer network and populated by a sentient evolving life form called the Darwinians"
arch=('i686' 'x86_64')
url="http://www.introversion.co.uk/darwinia/"
license=('custom')
depends_x86_64=('lib32-mesa' 'lib32-libstdc++5' 'lib32-gcc-libs' 'lib32-libvorbis' 'lib32-sdl')
depends_i686=('mesa' 'libstdc++5' 'gcc-libs' 'libvorbis' 'sdl')
source=('http://www.introversion.co.uk/darwinia/downloads/darwinia-demo2-1.3.0.sh'
        'darwinia-demo'
        'darwinia-demo.desktop')
md5sums=('ed5cbd41fbbffed431216a7a5e84e4fb'
         '71eb3cc2fc15b4f89dd6732baf09d597'
         '433dbcf35d0255b310fa150ca3b4b78b')

build() {
  cd "$srcdir"
  install -d ${srcdir}/darwinia-demo2
  chmod +x darwinia-demo2-1.3.0.sh
  ./darwinia-demo2-1.3.0.sh --noexec --nox11 --target darwinia-demo2
}

package() {
  cd ${srcdir}/darwinia-demo2
  install -d ${pkgdir}/opt/darwinia-demo2/lib
  install -D -m755 lib/darwinia.bin.x86 ${pkgdir}/opt/darwinia-demo2/lib/
  install -D lib/sounds.dat ${pkgdir}/opt/darwinia-demo2/lib/
  install -D lib/main.dat ${pkgdir}/opt/darwinia-demo2/lib/
  install -D lib/language.dat ${pkgdir}/opt/darwinia-demo2/lib/
  install -D lib/open-www.sh ${pkgdir}/opt/darwinia-demo2/lib/
  install -D darwinian.png ${pkgdir}/opt/darwinia-demo2/
  install -D -m775 bin/Linux/x86/darwinia ${pkgdir}/opt/darwinia-demo2/
  install -D LICENSE ${pkgdir}/opt/darwinia-demo2/
  install -D README ${pkgdir}/opt/darwinia-demo2/
  install -d ${pkgdir}/usr/bin
  install -D ${srcdir}/darwinia-demo ${pkgdir}/usr/bin/

  install -d ${pkgdir}/usr/share/applications
  install -D ${srcdir}/darwinia-demo.desktop ${pkgdir}/usr/share/applications/

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m644 ${srcdir}/darwinia-demo2/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
